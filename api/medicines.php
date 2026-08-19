<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $search = trim($_GET['search'] ?? '');
    $filter = trim($_GET['filter'] ?? '');
    $catId = isset($_GET['category_id']) ? (int)$_GET['category_id'] : 0;

    $sql = "SELECT m.*, c.name as category_name, DATEDIFF(m.expiry_date, CURDATE()) as days_until_expiry 
            FROM medicines m 
            JOIN categories c ON m.category_id = c.id 
            WHERE 1=1";
    $params = [];

    if (!empty($search)) {
        $sql .= " AND (m.name LIKE ? OR m.generic_name LIKE ? OR m.brand LIKE ? OR m.barcode LIKE ? OR m.batch_number LIKE ?)";
        $term = "%{$search}%";
        $params = array_merge($params, [$term, $term, $term, $term, $term]);
    }

    if ($catId > 0) {
        $sql .= " AND m.category_id = ?";
        $params[] = $catId;
    }

    if ($filter === 'low_stock') {
        $sql .= " AND m.quantity <= m.reorder_level";
    } elseif ($filter === 'expiring') {
        $sql .= " AND m.expiry_date <= DATE_ADD(CURDATE(), INTERVAL 90 DAY) AND m.expiry_date >= CURDATE()";
    } elseif ($filter === 'expired') {
        $sql .= " AND m.expiry_date < CURDATE()";
    }

    $sql .= " ORDER BY m.name ASC";

    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);
    $medicines = $stmt->fetchAll();

    responseJSON(['status' => 'success', 'data' => $medicines]);
}

if ($method === 'POST') {
    // Adding or updating medicine
    $input = json_decode(file_get_contents('php://input'), true);
    $action = $_GET['action'] ?? 'add';

    if ($action === 'add') {
        // Staff can add if authorized, but typically Founder manages inventory
        $name = trim($input['name'] ?? '');
        $genericName = trim($input['generic_name'] ?? '');
        $brand = trim($input['brand'] ?? '');
        $packsCards = trim($input['packs_cards'] ?? '');
        $categoryId = (int)($input['category_id'] ?? 0);
        $batchNumber = trim($input['batch_number'] ?? '');
        $barcode = trim($input['barcode'] ?? '');
        $manufacturer = trim($input['manufacturer'] ?? '');
        $purchasePrice = (float)($input['purchase_price'] ?? 0);
        $sellingPrice = (float)($input['selling_price'] ?? 0);
        $quantity = (int)($input['quantity'] ?? 0);
        $reorderLevel = (int)($input['reorder_level'] ?? 10);
        $expiryDate = trim($input['expiry_date'] ?? '');
        $storageLocation = trim($input['storage_location'] ?? 'Shelf A1');

        if (empty($name) || empty($genericName) || $categoryId <= 0 || empty($expiryDate)) {
            responseJSON(['status' => 'error', 'message' => 'Name, Generic Name, Category, and Expiry Date are required.'], 400);
        }

        if (empty($barcode)) {
            $barcode = '890' . rand(100000000, 999999999);
        }

        if (empty($batchNumber)) {
            $batchNumber = 'BATCH-' . strtoupper(substr(md5(uniqid()), 0, 8));
        }

        try {
            $stmt = $pdo->prepare("INSERT INTO medicines (name, generic_name, brand, packs_cards, category_id, batch_number, barcode, manufacturer, purchase_price, selling_price, quantity, reorder_level, expiry_date, storage_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            $stmt->execute([$name, $genericName, $brand, $packsCards, $categoryId, $batchNumber, $barcode, $manufacturer, $purchasePrice, $sellingPrice, $quantity, $reorderLevel, $expiryDate, $storageLocation]);
            
            $newId = $pdo->lastInsertId();
            logActivity($pdo, 'Add Medicine', "Added medicine: {$name} (Barcode: {$barcode})");

            responseJSON(['status' => 'success', 'message' => 'Medicine added successfully!', 'id' => $newId]);
        } catch (PDOException $e) {
            responseJSON(['status' => 'error', 'message' => 'Error adding medicine: ' . $e->getMessage()], 400);
        }
    }

    if ($action === 'edit') {
        $id = (int)($input['id'] ?? 0);
        if ($id <= 0) {
            responseJSON(['status' => 'error', 'message' => 'Invalid medicine ID.'], 400);
        }

        $name = trim($input['name'] ?? '');
        $genericName = trim($input['generic_name'] ?? '');
        $brand = trim($input['brand'] ?? '');
        $packsCards = trim($input['packs_cards'] ?? '');
        $categoryId = (int)($input['category_id'] ?? 0);
        $batchNumber = trim($input['batch_number'] ?? '');
        $barcode = trim($input['barcode'] ?? '');
        $manufacturer = trim($input['manufacturer'] ?? '');
        $purchasePrice = (float)($input['purchase_price'] ?? 0);
        $sellingPrice = (float)($input['selling_price'] ?? 0);
        $quantity = (int)($input['quantity'] ?? 0);
        $reorderLevel = (int)($input['reorder_level'] ?? 10);
        $expiryDate = trim($input['expiry_date'] ?? '');
        $storageLocation = trim($input['storage_location'] ?? 'Shelf A1');

        try {
            $stmt = $pdo->prepare("UPDATE medicines SET name=?, generic_name=?, brand=?, packs_cards=?, category_id=?, batch_number=?, barcode=?, manufacturer=?, purchase_price=?, selling_price=?, quantity=?, reorder_level=?, expiry_date=?, storage_location=? WHERE id=?");
            $stmt->execute([$name, $genericName, $brand, $packsCards, $categoryId, $batchNumber, $barcode, $manufacturer, $purchasePrice, $sellingPrice, $quantity, $reorderLevel, $expiryDate, $storageLocation, $id]);

            logActivity($pdo, 'Update Medicine', "Updated medicine ID {$id}: {$name}");

            responseJSON(['status' => 'success', 'message' => 'Medicine updated successfully!']);
        } catch (PDOException $e) {
            responseJSON(['status' => 'error', 'message' => 'Error updating medicine: ' . $e->getMessage()], 400);
        }
    }
}

if ($method === 'DELETE') {
    // Only Founder can delete medicines!
    requireFounder();
    $id = (int)($_GET['id'] ?? 0);
    if ($id <= 0) {
        responseJSON(['status' => 'error', 'message' => 'Invalid medicine ID.'], 400);
    }

    $stmt = $pdo->prepare("DELETE FROM medicines WHERE id = ?");
    $stmt->execute([$id]);

    logActivity($pdo, 'Delete Medicine', "Deleted medicine ID {$id}");
    responseJSON(['status' => 'success', 'message' => 'Medicine deleted successfully.']);
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
