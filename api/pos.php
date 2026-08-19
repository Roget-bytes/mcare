<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    // POS medicine lookup by query (name or barcode scan)
    $query = trim($_GET['query'] ?? '');
    
    $sql = "SELECT m.id, m.name, m.generic_name, m.brand, m.packs_cards, m.batch_number, m.barcode, m.selling_price, m.purchase_price, m.quantity, m.reorder_level, m.expiry_date, m.storage_location, c.name as category_name 
            FROM medicines m 
            JOIN categories c ON m.category_id = c.id 
            WHERE m.quantity > 0 AND m.expiry_date >= CURDATE()";
    $params = [];

    if (!empty($query)) {
        $sql .= " AND (m.name LIKE ? OR m.generic_name LIKE ? OR m.brand LIKE ? OR m.barcode = ? OR m.batch_number = ?)";
        $term = "%{$query}%";
        $params = [$term, $term, $term, $query, $query];
    }

    $sql .= " ORDER BY m.name ASC LIMIT 30";
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);

    responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
}

if ($method === 'POST') {
    // Process Checkout
    $input = json_decode(file_get_contents('php://input'), true);

    // Validate and locate valid customer ID to avoid Foreign Key constraint violation
    $rawCustId = isset($input['customer_id']) ? (int)$input['customer_id'] : 1;
    $customerId = null;

    if ($rawCustId > 0) {
        $cCheck = $pdo->prepare("SELECT id FROM customers WHERE id = ?");
        $cCheck->execute([$rawCustId]);
        if ($cCheck->fetch()) {
            $customerId = $rawCustId;
        }
    }

    if ($customerId === null) {
        // Check default Walk-in Customer (ID 1)
        $cCheck1 = $pdo->query("SELECT id FROM customers WHERE id = 1")->fetch();
        if ($cCheck1) {
            $customerId = 1;
        } else {
            // Fallback to first registered customer or NULL
            $firstCust = $pdo->query("SELECT id FROM customers ORDER BY id ASC LIMIT 1")->fetch();
            $customerId = $firstCust ? (int)$firstCust['id'] : null;
        }
    }

    $items = $input['items'] ?? [];
    $subtotal = (float)($input['subtotal'] ?? 0);
    $grandTotal = (float)($input['grand_total'] ?? 0);
    $paidAmount = (float)($input['paid_amount'] ?? 0);
    $changeAmount = (float)($input['change_amount'] ?? 0);
    $paymentMethod = in_array($input['payment_method'] ?? 'cash', ['cash', 'card', 'mobile_money']) ? $input['payment_method'] : 'cash';

    if (empty($items) || count($items) === 0) {
        responseJSON(['status' => 'error', 'message' => 'Cannot checkout an empty cart.'], 400);
    }

    if ($paidAmount < $grandTotal && $paymentMethod === 'cash') {
        responseJSON(['status' => 'error', 'message' => 'Paid amount is less than the total due.'], 400);
    }

    try {
        $pdo->beginTransaction();

        // Generate Serial 9-Digit Invoice Number (e.g., 000000001)
        $maxStmt = $pdo->query("SELECT COALESCE(MAX(id), 0) + 1 AS next_seq FROM sales");
        $nextSeq = (int)$maxStmt->fetch()['next_seq'];
        $invoiceNo = str_pad($nextSeq, 9, '0', STR_PAD_LEFT);

        // Insert into sales
        $stmtSales = $pdo->prepare("INSERT INTO sales (invoice_no, customer_id, subtotal, grand_total, paid_amount, change_amount, payment_method, created_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmtSales->execute([$invoiceNo, $customerId, $subtotal, $grandTotal, $paidAmount, $changeAmount, $paymentMethod, $user['id']]);
        $saleId = $pdo->lastInsertId();

        $saleItemsProcessed = [];

        foreach ($items as $item) {
            $medicineId = (int)$item['medicine_id'];
            $qty = (int)$item['quantity'];
            $unitPrice = (float)$item['unit_price'];

            if ($medicineId <= 0 || $qty <= 0) {
                continue;
            }

            // Fetch medicine stock & details
            $medStmt = $pdo->prepare("SELECT name, quantity, purchase_price, batch_number FROM medicines WHERE id = ? FOR UPDATE");
            $medStmt->execute([$medicineId]);
            $med = $medStmt->fetch();

            if (!$med) {
                throw new Exception("Medicine ID {$medicineId} not found.");
            }

            if ($med['quantity'] < $qty) {
                throw new Exception("Insufficient stock for '{$med['name']}'. Available: {$med['quantity']}, Requested: {$qty}");
            }

            $unitCost = (float)$med['purchase_price'];
            $itemSubtotal = $unitPrice * $qty;
            $itemProfit = ($unitPrice - $unitCost) * $qty;

            // Insert into sale_items
            $itemStmt = $pdo->prepare("INSERT INTO sale_items (sale_id, medicine_id, batch_number, quantity, unit_price, unit_cost, subtotal, profit) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
            $itemStmt->execute([$saleId, $medicineId, $med['batch_number'], $qty, $unitPrice, $unitCost, $itemSubtotal, $itemProfit]);

            // Deduct inventory
            $deductStmt = $pdo->prepare("UPDATE medicines SET quantity = quantity - ? WHERE id = ?");
            $deductStmt->execute([$qty, $medicineId]);

            $saleItemsProcessed[] = [
                'name' => $med['name'],
                'batch_number' => $med['batch_number'],
                'quantity' => $qty,
                'unit_price' => $unitPrice,
                'subtotal' => $itemSubtotal
            ];
        }

        $pdo->commit();

        logActivity($pdo, 'POS Checkout', "Created Invoice {$invoiceNo} for Total: ₦{$grandTotal} ({$paymentMethod})");

        // Fetch customer details & pharmacy settings for receipt
        $custStmt = $pdo->prepare("SELECT name, phone FROM customers WHERE id = ?");
        $custStmt->execute([$customerId]);
        $cust = $custStmt->fetch();

        $settingsStmt = $pdo->query("SELECT setting_key, setting_value FROM settings");
        $settingsRaw = $settingsStmt->fetchAll();
        $settings = [];
        foreach ($settingsRaw as $s) {
            $settings[$s['setting_key']] = $s['setting_value'];
        }

        responseJSON([
            'status' => 'success',
            'message' => 'Sale completed successfully!',
            'invoice' => [
                'id' => $saleId,
                'invoice_no' => $invoiceNo,
                'sale_date' => date('Y-m-d H:i:s'),
                'customer_name' => $cust ? $cust['name'] : 'Walk-in Customer',
                'customer_phone' => $cust ? $cust['phone'] : 'N/A',
                'cashier_name' => $user['full_name'],
                'payment_method' => strtoupper($paymentMethod),
                'subtotal' => $subtotal,
                'grand_total' => $grandTotal,
                'paid_amount' => $paidAmount,
                'change_amount' => $changeAmount,
                'items' => $saleItemsProcessed,
                'pharmacy' => $settings
            ]
        ]);

    } catch (Exception $e) {
        $pdo->rollBack();
        responseJSON(['status' => 'error', 'message' => $e->getMessage()], 400);
    }
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
