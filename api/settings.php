<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT setting_key, setting_value FROM settings");
    $raw = $stmt->fetchAll();
    $settings = [];
    foreach ($raw as $r) {
        $settings[$r['setting_key']] = $r['setting_value'];
    }

    $branchesStmt = $pdo->query("SELECT * FROM branches ORDER BY is_main DESC, branch_name ASC");
    $branches = $branchesStmt->fetchAll();

    responseJSON(['status' => 'success', 'data' => $settings, 'branches' => $branches]);
}

if ($method === 'POST') {
    requireFounder();
    $input = json_decode(file_get_contents('php://input'), true);

    if (empty($input)) {
        responseJSON(['status' => 'error', 'message' => 'No settings data provided.'], 400);
    }

    try {
        $pdo->beginTransaction();

        $allowedKeys = [
            'pharmacy_name', 'pharmacy_short_name', 'welcome_message',
            'address', 'phone', 'email', 'currency_symbol',
            'invoice_footer', 'theme_mode'
        ];

        foreach ($input as $key => $val) {
            if (in_array($key, $allowedKeys)) {
                $stmt = $pdo->prepare("INSERT INTO settings (setting_key, setting_value) VALUES (?, ?) ON DUPLICATE KEY UPDATE setting_value = ?");
                $stmt->execute([$key, $val, $val]);
            }
        }

        $pdo->commit();
        logActivity($pdo, 'System Settings Update', 'Pharmacy profile and system settings updated by Founder.');
        responseJSON(['status' => 'success', 'message' => 'Pharmacy settings updated successfully!']);
    } catch (Exception $e) {
        $pdo->rollBack();
        responseJSON(['status' => 'error', 'message' => $e->getMessage()], 400);
    }
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
