<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT c.*, COUNT(m.id) as item_count FROM categories c LEFT JOIN medicines m ON c.id = m.category_id GROUP BY c.id ORDER BY c.name ASC");
    responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
}

if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $action = $_GET['action'] ?? 'add';

    if ($action === 'add') {
        $name = trim($input['name'] ?? '');
        $description = trim($input['description'] ?? '');

        if (empty($name)) {
            responseJSON(['status' => 'error', 'message' => 'Category name is required.'], 400);
        }

        try {
            $stmt = $pdo->prepare("INSERT INTO categories (name, description) VALUES (?, ?)");
            $stmt->execute([$name, $description]);
            logActivity($pdo, 'Add Category', "Added category: {$name}");
            responseJSON(['status' => 'success', 'message' => 'Category added successfully!']);
        } catch (PDOException $e) {
            responseJSON(['status' => 'error', 'message' => 'Category name already exists or error occurred.'], 400);
        }
    }

    if ($action === 'edit') {
        $id = (int)($input['id'] ?? 0);
        $name = trim($input['name'] ?? '');
        $description = trim($input['description'] ?? '');

        if ($id <= 0 || empty($name)) {
            responseJSON(['status' => 'error', 'message' => 'Invalid category parameters.'], 400);
        }

        $stmt = $pdo->prepare("UPDATE categories SET name = ?, description = ? WHERE id = ?");
        $stmt->execute([$name, $description, $id]);
        logActivity($pdo, 'Edit Category', "Updated category ID {$id}: {$name}");
        responseJSON(['status' => 'success', 'message' => 'Category updated successfully!']);
    }
}

if ($method === 'DELETE') {
    requireFounder();
    $id = (int)($_GET['id'] ?? 0);
    $stmt = $pdo->prepare("DELETE FROM categories WHERE id = ?");
    $stmt->execute([$id]);
    logActivity($pdo, 'Delete Category', "Deleted category ID {$id}");
    responseJSON(['status' => 'success', 'message' => 'Category deleted successfully.']);
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
