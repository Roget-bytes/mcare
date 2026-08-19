<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();

if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $saleId = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($saleId > 0) {
        // Fetch single sale with item breakdown for reprint / view
        $stmt = $pdo->prepare("SELECT s.*, COALESCE(c.name, 'Walk-in Customer') as customer_name, c.phone as customer_phone, u.full_name as staff_name FROM sales s LEFT JOIN customers c ON s.customer_id = c.id JOIN users u ON s.created_by = u.id WHERE s.id = ?");
        $stmt->execute([$saleId]);
        $sale = $stmt->fetch();

        if (!$sale) {
            responseJSON(['status' => 'error', 'message' => 'Invoice not found.'], 404);
        }

        $itemsStmt = $pdo->prepare("SELECT si.*, m.name as medicine_name, m.brand FROM sale_items si JOIN medicines m ON si.medicine_id = m.id WHERE si.sale_id = ?");
        $itemsStmt->execute([$saleId]);
        $sale['items'] = $itemsStmt->fetchAll();

        // Get pharmacy settings
        $settingsStmt = $pdo->query("SELECT setting_key, setting_value FROM settings");
        $settingsRaw = $settingsStmt->fetchAll();
        $settings = [];
        foreach ($settingsRaw as $s) {
            $settings[$s['setting_key']] = $s['setting_value'];
        }
        $sale['pharmacy'] = $settings;

        responseJSON(['status' => 'success', 'data' => $sale]);
    } else {
        // List recent sales
        $search = trim($_GET['search'] ?? '');
        $sql = "SELECT s.*, COALESCE(c.name, 'Walk-in Customer') as customer_name, u.full_name as staff_name 
                FROM sales s 
                LEFT JOIN customers c ON s.customer_id = c.id 
                JOIN users u ON s.created_by = u.id 
                WHERE 1=1";
        $params = [];

        if (!empty($search)) {
            $sql .= " AND (s.invoice_no LIKE ? OR c.name LIKE ? OR u.full_name LIKE ?)";
            $term = "%{$search}%";
            $params = [$term, $term, $term];
        }

        $sql .= " ORDER BY s.sale_date DESC LIMIT 100";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);

        responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
    }
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
