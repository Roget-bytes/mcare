<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();

// Financial reports are restricted to Founder
$type = $_GET['type'] ?? 'daily';
$startDate = $_GET['start_date'] ?? date('Y-m-d', strtotime('-30 days'));
$endDate = $_GET['end_date'] ?? date('Y-m-d');

if (in_array($type, ['profit_loss', 'financial', 'staff_performance'])) {
    requireFounder();
}

if ($type === 'sales') {
    // Sales report filtered by date range
    $stmt = $pdo->prepare("SELECT s.*, COALESCE(c.name, 'Walk-in Customer') as customer_name, u.full_name as staff_name FROM sales s LEFT JOIN customers c ON s.customer_id = c.id JOIN users u ON s.created_by = u.id WHERE DATE(s.sale_date) BETWEEN ? AND ? ORDER BY s.sale_date DESC");
    $stmt->execute([$startDate, $endDate]);
    $sales = $stmt->fetchAll();

    $summaryStmt = $pdo->prepare("SELECT COALESCE(SUM(grand_total),0) as total_revenue, COALESCE(SUM(subtotal),0) as total_subtotal, COUNT(*) as invoice_count FROM sales WHERE DATE(sale_date) BETWEEN ? AND ?");
    $summaryStmt->execute([$startDate, $endDate]);
    $summary = $summaryStmt->fetch();

    responseJSON([
        'status' => 'success',
        'report_type' => 'sales',
        'start_date' => $startDate,
        'end_date' => $endDate,
        'summary' => $summary,
        'data' => $sales
    ]);
}

if ($type === 'profit_loss') {
    // Profit & Loss statement
    $stmt = $pdo->prepare("SELECT 
        COALESCE(SUM(s.grand_total), 0) as gross_revenue,
        COALESCE(SUM(si.unit_cost * si.quantity), 0) as cost_of_goods_sold,
        COALESCE(SUM(si.profit), 0) as net_profit
        FROM sales s 
        JOIN sale_items si ON s.id = si.sale_id 
        WHERE DATE(s.sale_date) BETWEEN ? AND ?");
    $stmt->execute([$startDate, $endDate]);
    $financials = $stmt->fetch();

    // Purchase expenses in period
    $pStmt = $pdo->prepare("SELECT COALESCE(SUM(total_amount),0) as total_purchases FROM purchases WHERE DATE(purchase_date) BETWEEN ? AND ?");
    $pStmt->execute([$startDate, $endDate]);
    $purchases = $pStmt->fetch();

    responseJSON([
        'status' => 'success',
        'report_type' => 'profit_loss',
        'start_date' => $startDate,
        'end_date' => $endDate,
        'gross_revenue' => (float)$financials['gross_revenue'],
        'cost_of_goods_sold' => (float)$financials['cost_of_goods_sold'],
        'net_profit' => (float)$financials['net_profit'],
        'total_purchases' => (float)$purchases['total_purchases']
    ]);
}

if ($type === 'inventory') {
    // Inventory Valuation Report
    $stmt = $pdo->query("SELECT m.*, c.name as category_name, (m.purchase_price * m.quantity) as asset_value, (m.selling_price * m.quantity) as potential_revenue FROM medicines m JOIN categories c ON m.category_id = c.id ORDER BY m.name ASC");
    $items = $stmt->fetchAll();

    $totVal = $pdo->query("SELECT COALESCE(SUM(purchase_price * quantity), 0) as total_cost_valuation, COALESCE(SUM(selling_price * quantity), 0) as total_retail_valuation FROM medicines")->fetch();

    responseJSON([
        'status' => 'success',
        'report_type' => 'inventory',
        'summary' => $totVal,
        'data' => $items
    ]);
}

if ($type === 'expired') {
    // Expired Medicines Report
    $stmt = $pdo->query("SELECT m.*, c.name as category_name, DATEDIFF(m.expiry_date, CURDATE()) as days_past FROM medicines m JOIN categories c ON m.category_id = c.id WHERE m.expiry_date <= CURDATE() ORDER BY m.expiry_date ASC");
    $items = $stmt->fetchAll();

    responseJSON([
        'status' => 'success',
        'report_type' => 'expired',
        'data' => $items
    ]);
}

if ($type === 'low_stock') {
    // Low Stock Report
    $stmt = $pdo->query("SELECT m.*, c.name as category_name FROM medicines m JOIN categories c ON m.category_id = c.id WHERE m.quantity <= m.reorder_level ORDER BY m.quantity ASC");
    $items = $stmt->fetchAll();

    responseJSON([
        'status' => 'success',
        'report_type' => 'low_stock',
        'data' => $items
    ]);
}

if ($type === 'staff_performance') {
    // Staff Performance Summary
    $stmt = $pdo->prepare("SELECT u.id, u.full_name, u.role, COUNT(s.id) as total_transactions, COALESCE(SUM(s.grand_total), 0) as total_revenue, COALESCE(AVG(s.grand_total), 0) as avg_sale_value FROM users u LEFT JOIN sales s ON u.id = s.created_by AND DATE(s.sale_date) BETWEEN ? AND ? GROUP BY u.id ORDER BY total_revenue DESC");
    $stmt->execute([$startDate, $endDate]);
    $performance = $stmt->fetchAll();

    responseJSON([
        'status' => 'success',
        'report_type' => 'staff_performance',
        'start_date' => $startDate,
        'end_date' => $endDate,
        'data' => $performance
    ]);
}

responseJSON(['status' => 'error', 'message' => 'Invalid report type requested.'], 400);
