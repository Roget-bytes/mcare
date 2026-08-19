<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $search = trim($_GET['search'] ?? '');
    $sql = "SELECT c.*, COUNT(s.id) as total_orders, COALESCE(SUM(s.grand_total), 0) as total_spent 
            FROM customers c 
            LEFT JOIN sales s ON c.id = s.customer_id 
            WHERE 1=1";
    $params = [];

    if (!empty($search)) {
        $sql .= " AND (c.name LIKE ? OR c.phone LIKE ? OR c.email LIKE ?)";
        $term = "%{$search}%";
        $params = [$term, $term, $term];
    }

    $sql .= " GROUP BY c.id ORDER BY c.id ASC";
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);

    responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
}

if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $action = $_GET['action'] ?? 'add';

    if ($action === 'add') {
        $name = trim($input['name'] ?? '');
        $phone = trim($input['phone'] ?? '');
        $email = trim($input['email'] ?? '');
        $address = trim($input['address'] ?? '');

        if (empty($name) || empty($phone)) {
            responseJSON(['status' => 'error', 'message' => 'Customer name and phone number are required.'], 400);
        }

        try {
            $stmt = $pdo->prepare("INSERT INTO customers (name, phone, email, address) VALUES (?, ?, ?, ?)");
            $stmt->execute([$name, $phone, $email, $address]);
            $newId = $pdo->lastInsertId();

            logActivity($pdo, 'Add Customer', "Registered customer: {$name} ({$phone})");
            responseJSON(['status' => 'success', 'message' => 'Customer registered successfully!', 'id' => $newId, 'name' => $name, 'phone' => $phone]);
        } catch (PDOException $e) {
            responseJSON(['status' => 'error', 'message' => 'Phone number already exists.'], 400);
        }
    }

    if ($action === 'edit') {
        $id = (int)($input['id'] ?? 0);
        $name = trim($input['name'] ?? '');
        $phone = trim($input['phone'] ?? '');
        $email = trim($input['email'] ?? '');
        $address = trim($input['address'] ?? '');

        $stmt = $pdo->prepare("UPDATE customers SET name = ?, phone = ?, email = ?, address = ? WHERE id = ?");
        $stmt->execute([$name, $phone, $email, $address, $id]);

        logActivity($pdo, 'Edit Customer', "Updated customer ID {$id}: {$name}");
        responseJSON(['status' => 'success', 'message' => 'Customer updated successfully!']);
    }
}

if ($method === 'DELETE') {
    requireFounder();
    $id = (int)($_GET['id'] ?? 0);
    if ($id === 1) {
        responseJSON(['status' => 'error', 'message' => 'Cannot delete default Walk-in Customer.'], 400);
    }
    $stmt = $pdo->prepare("DELETE FROM customers WHERE id = ?");
    $stmt->execute([$id]);

    logActivity($pdo, 'Delete Customer', "Deleted customer ID {$id}");
    responseJSON(['status' => 'success', 'message' => 'Customer deleted successfully.']);
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
