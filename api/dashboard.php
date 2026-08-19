<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();

// Overall Stats
$totalSales = $pdo->query("SELECT COALESCE(SUM(grand_total), 0) AS total, COUNT(*) as count FROM sales")->fetch();
$todaySales = $pdo->query("SELECT COALESCE(SUM(grand_total), 0) AS total, COUNT(*) as count FROM sales WHERE DATE(sale_date) = CURDATE()")->fetch();
$monthlySales = $pdo->query("SELECT COALESCE(SUM(grand_total), 0) AS total FROM sales WHERE MONTH(sale_date) = MONTH(CURDATE()) AND YEAR(sale_date) = YEAR(CURDATE())")->fetch();

// Profit Summaries (Daily, Weekly, Monthly, Total)
$todayProfit = $pdo->query("SELECT COALESCE(SUM(si.profit), 0) AS total FROM sale_items si JOIN sales s ON si.sale_id = s.id WHERE DATE(s.sale_date) = CURDATE()")->fetch()['total'];
$weeklyProfit = $pdo->query("SELECT COALESCE(SUM(si.profit), 0) AS total FROM sale_items si JOIN sales s ON si.sale_id = s.id WHERE s.sale_date >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)")->fetch()['total'];
$monthlyProfit = $pdo->query("SELECT COALESCE(SUM(si.profit), 0) AS total FROM sale_items si JOIN sales s ON si.sale_id = s.id WHERE MONTH(s.sale_date) = MONTH(CURDATE()) AND YEAR(s.sale_date) = YEAR(CURDATE())")->fetch()['total'];
$profitSummary = $pdo->query("SELECT COALESCE(SUM(profit), 0) AS total_profit FROM sale_items")->fetch()['total_profit'];

$totalMedicines = $pdo->query("SELECT COUNT(*) AS count FROM medicines")->fetch()['count'];
$totalCustomers = $pdo->query("SELECT COUNT(*) AS count FROM customers")->fetch()['count'];
$totalSuppliers = $pdo->query("SELECT COUNT(*) AS count FROM suppliers")->fetch()['count'];

// Alerts
$lowStockStmt = $pdo->query("SELECT m.*, c.name as category_name FROM medicines m JOIN categories c ON m.category_id = c.id WHERE m.quantity <= m.reorder_level ORDER BY m.quantity ASC LIMIT 10");
$lowStockItems = $lowStockStmt->fetchAll();

$expiringStmt = $pdo->query("SELECT m.*, c.name as category_name, DATEDIFF(m.expiry_date, CURDATE()) as days_left FROM medicines m JOIN categories c ON m.category_id = c.id WHERE m.expiry_date <= DATE_ADD(CURDATE(), INTERVAL 90 DAY) ORDER BY m.expiry_date ASC LIMIT 10");
$expiringItems = $expiringStmt->fetchAll();

// Recent Sales
$recentSalesStmt = $pdo->query("SELECT s.*, COALESCE(c.name, 'Walk-in Customer') as customer_name, u.full_name as staff_name FROM sales s LEFT JOIN customers c ON s.customer_id = c.id JOIN users u ON s.created_by = u.id ORDER BY s.sale_date DESC LIMIT 5");
$recentSales = $recentSalesStmt->fetchAll();

// Top Selling Medicines
$topSellingStmt = $pdo->query("SELECT m.name, m.brand, SUM(si.quantity) as total_qty, SUM(si.subtotal) as total_revenue FROM sale_items si JOIN medicines m ON si.medicine_id = m.id GROUP BY si.medicine_id ORDER BY total_qty DESC LIMIT 5");
$topSelling = $topSellingStmt->fetchAll();

// 7-Day Chart Trend
$chartStmt = $pdo->query("SELECT DATE(sale_date) as sale_day, SUM(grand_total) as daily_total, COUNT(*) as tx_count FROM sales WHERE sale_date >= DATE_SUB(CURDATE(), INTERVAL 6 DAY) GROUP BY DATE(sale_date) ORDER BY sale_day ASC");
$dailyTrends = $chartStmt->fetchAll();

// Category Distribution Chart
$catChartStmt = $pdo->query("SELECT c.name, COUNT(m.id) as item_count, SUM(m.quantity) as stock_qty FROM categories c LEFT JOIN medicines m ON c.id = m.category_id GROUP BY c.id");
$catDistribution = $catChartStmt->fetchAll();

responseJSON([
    'status' => 'success',
    'kpi' => [
        'total_sales_amount' => (float)$totalSales['total'],
        'total_sales_count' => (int)$totalSales['count'],
        'today_sales_amount' => (float)$todaySales['total'],
        'today_sales_count' => (int)$todaySales['count'],
        'monthly_sales_amount' => (float)$monthlySales['total'],
        'today_profit' => (float)$todayProfit,
        'weekly_profit' => (float)$weeklyProfit,
        'monthly_profit' => (float)$monthlyProfit,
        'total_profit' => (float)$profitSummary,
        'total_medicines' => (int)$totalMedicines,
        'total_customers' => (int)$totalCustomers,
        'total_suppliers' => (int)$totalSuppliers,
        'low_stock_count' => count($lowStockItems),
        'expiring_count' => count($expiringItems)
    ],
    'low_stock_items' => $lowStockItems,
    'expiring_items' => $expiringItems,
    'recent_sales' => $recentSales,
    'top_selling' => $topSelling,
    'daily_trends' => $dailyTrends,
    'category_distribution' => $catDistribution
]);
