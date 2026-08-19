<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT s.*, (SELECT COUNT(*) FROM purchases p WHERE p.supplier_id = s.id) as total_purchases FROM suppliers s ORDER BY s.name ASC");
    responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
}

if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $action = $_GET['action'] ?? 'add';

    if ($action === 'add') {
        $name = trim($input['name'] ?? '');
        $companyName = trim($input['company_name'] ?? '');
        $phone = trim($input['phone'] ?? '');
        $email = trim($input['email'] ?? '');
        $address = trim($input['address'] ?? '');

        if (empty($name) || empty($phone)) {
            responseJSON(['status' => 'error', 'message' => 'Supplier name and phone are required.'], 400);
        }

        $stmt = $pdo->prepare("INSERT INTO suppliers (name, company_name, phone, email, address) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$name, $companyName, $phone, $email, $address]);

        logActivity($pdo, 'Add Supplier', "Added supplier: {$name} ({$companyName})");
        responseJSON(['status' => 'success', 'message' => 'Supplier added successfully!']);
    }

    if ($action === 'edit') {
        $id = (int)($input['id'] ?? 0);
        $name = trim($input['name'] ?? '');
        $companyName = trim($input['company_name'] ?? '');
        $phone = trim($input['phone'] ?? '');
        $email = trim($input['email'] ?? '');
        $address = trim($input['address'] ?? '');

        $stmt = $pdo->prepare("UPDATE suppliers SET name = ?, company_name = ?, phone = ?, email = ?, address = ? WHERE id = ?");
        $stmt->execute([$name, $companyName, $phone, $email, $address, $id]);

        logActivity($pdo, 'Edit Supplier', "Updated supplier ID {$id}: {$name}");
        responseJSON(['status' => 'success', 'message' => 'Supplier updated successfully!']);
    }
}

if ($method === 'DELETE') {
    requireFounder();
    $id = (int)($_GET['id'] ?? 0);
    $stmt = $pdo->prepare("DELETE FROM suppliers WHERE id = ?");
    $stmt->execute([$id]);

    logActivity($pdo, 'Delete Supplier', "Deleted supplier ID {$id}");
    responseJSON(['status' => 'success', 'message' => 'Supplier deleted successfully.']);
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
