<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $purchaseId = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($purchaseId > 0) {
        $stmt = $pdo->prepare("SELECT p.*, s.name as supplier_name, s.company_name, u.full_name as created_by_name FROM purchases p JOIN suppliers s ON p.supplier_id = s.id JOIN users u ON p.created_by = u.id WHERE p.id = ?");
        $stmt->execute([$purchaseId]);
        $purchase = $stmt->fetch();

        if (!$purchase) {
            responseJSON(['status' => 'error', 'message' => 'Purchase record not found.'], 404);
        }

        $itemsStmt = $pdo->prepare("SELECT pi.*, m.name as medicine_name, m.brand FROM purchase_items pi JOIN medicines m ON pi.medicine_id = m.id WHERE pi.purchase_id = ?");
        $itemsStmt->execute([$purchaseId]);
        $purchase['items'] = $itemsStmt->fetchAll();

        responseJSON(['status' => 'success', 'data' => $purchase]);
    } else {
        $stmt = $pdo->query("SELECT p.*, s.name as supplier_name, s.company_name, u.full_name as created_by_name FROM purchases p JOIN suppliers s ON p.supplier_id = s.id JOIN users u ON p.created_by = u.id ORDER BY p.purchase_date DESC");
        responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
    }
}

if ($method === 'POST') {
    // Create new Purchase Order & auto-adjust stock
    $input = json_decode(file_get_contents('php://input'), true);

    $supplierId = (int)($input['supplier_id'] ?? 0);
    $purchaseDate = trim($input['purchase_date'] ?? date('Y-m-d'));
    $items = $input['items'] ?? [];
    $paidAmount = (float)($input['paid_amount'] ?? 0);
    $notes = trim($input['notes'] ?? '');

    if ($supplierId <= 0 || empty($items)) {
        responseJSON(['status' => 'error', 'message' => 'Supplier and items are required.'], 400);
    }

    try {
        $pdo->beginTransaction();

        $purchaseNo = 'PO-' . date('Ymd') . '-' . rand(100, 999);
        $totalAmount = 0;

        foreach ($items as $item) {
            $totalAmount += ((float)$item['unit_cost'] * (int)$item['quantity']);
        }

        $paymentStatus = 'paid';
        if ($paidAmount < $totalAmount) {
            $paymentStatus = ($paidAmount > 0) ? 'partial' : 'due';
        }

        $stmt = $pdo->prepare("INSERT INTO purchases (purchase_no, supplier_id, purchase_date, total_amount, paid_amount, payment_status, notes, created_by) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->execute([$purchaseNo, $supplierId, $purchaseDate, $totalAmount, $paidAmount, $paymentStatus, $notes, $user['id']]);
        $purchaseId = $pdo->lastInsertId();

        foreach ($items as $item) {
            $medicineId = (int)$item['medicine_id'];
            $qty = (int)$item['quantity'];
            $unitCost = (float)$item['unit_cost'];
            $subtotal = $qty * $unitCost;

            // Insert purchase item
            $piStmt = $pdo->prepare("INSERT INTO purchase_items (purchase_id, medicine_id, quantity, unit_cost, subtotal) VALUES (?, ?, ?, ?, ?)");
            $piStmt->execute([$purchaseId, $medicineId, $qty, $unitCost, $subtotal]);

            // Increase medicine quantity & update unit cost
            $upMed = $pdo->prepare("UPDATE medicines SET quantity = quantity + ?, purchase_price = ? WHERE id = ?");
            $upMed->execute([$qty, $unitCost, $medicineId]);
        }

        $pdo->commit();

        logActivity($pdo, 'New Stock Purchase', "Created Purchase Order {$purchaseNo} for Total: ₦{$totalAmount}");
        responseJSON(['status' => 'success', 'message' => 'Purchase recorded and stock inventory updated!']);
    } catch (Exception $e) {
        $pdo->rollBack();
        responseJSON(['status' => 'error', 'message' => $e->getMessage()], 400);
    }
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
