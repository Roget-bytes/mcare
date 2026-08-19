<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
// Audit logs are accessible to Founder
requireFounder();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $search = trim($_GET['search'] ?? '');
    $sql = "SELECT * FROM activity_logs WHERE 1=1";
    $params = [];

    if (!empty($search)) {
        $sql .= " AND (user_name LIKE ? OR action LIKE ? OR details LIKE ? OR ip_address LIKE ?)";
        $term = "%{$search}%";
        $params = [$term, $term, $term, $term];
    }

    $sql .= " ORDER BY created_at DESC LIMIT 200";
    $stmt = $pdo->prepare($sql);
    $stmt->execute($params);

    responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
