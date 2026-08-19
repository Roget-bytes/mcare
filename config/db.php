<?php
// M - CARE MODERN PHARMACY MANAGEMENT SYSTEM (MCPMS)
// Database Connection & Helper Utilities

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Set default timezone
date_default_timezone_set('UTC');

define('DB_HOST', '127.0.0.1');
define('DB_USER', 'root');
define('DB_PASS', '');
define('DB_NAME', 'mcares_db');

function getDBConnection() {
    static $pdo = null;
    if ($pdo === null) {
        try {
            $dsn = "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4";
            $options = [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                PDO::ATTR_EMULATE_PREPARES => false,
            ];
            $pdo = new PDO($dsn, DB_USER, DB_PASS, $options);
            
            // Auto-update sample passwords on first load to valid PHP bcrypt hashes
            autoSeedPasswordHashes($pdo);
            autoMigrateDatabase($pdo);
        } catch (PDOException $e) {
            header('Content-Type: application/json');
            echo json_encode([
                'status' => 'error',
                'message' => 'Database connection failed: ' . $e->getMessage()
            ]);
            exit;
        }
    }
    return $pdo;
}

function autoMigrateDatabase($pdo) {
    try {
        $colCheck = $pdo->query("SHOW COLUMNS FROM medicines LIKE 'packs_cards'");
        if (!$colCheck || $colCheck->rowCount() === 0) {
            $pdo->exec("ALTER TABLE medicines ADD COLUMN packs_cards VARCHAR(100) DEFAULT NULL AFTER brand");
        }
    } catch (Exception $e) {}

    try {
        $custCheck = $pdo->query("SELECT id FROM customers WHERE id = 1");
        if (!$custCheck || $custCheck->rowCount() === 0) {
            $pdo->exec("INSERT IGNORE INTO customers (id, name, phone, email, address) VALUES (1, 'Walk-in Customer', '0000000000', 'walkin@mcare.com', 'N/A')");
        }
    } catch (Exception $e) {}
}

function autoSeedPasswordHashes($pdo) {
    // Ensure admin and staff passwords match admin123 / staff123
    $stmt = $pdo->query("SELECT id, username, password FROM users WHERE username IN ('admin', 'staff')");
    $users = $stmt->fetchAll();
    foreach ($users as $u) {
        if ($u['username'] === 'admin' && !password_verify('admin123', $u['password'])) {
            $hash = password_hash('admin123', PASSWORD_BCRYPT);
            $up = $pdo->prepare("UPDATE users SET password = ? WHERE id = ?");
            $up->execute([$hash, $u['id']]);
        }
        if ($u['username'] === 'staff' && !password_verify('staff123', $u['password'])) {
            $hash = password_hash('staff123', PASSWORD_BCRYPT);
            $up = $pdo->prepare("UPDATE users SET password = ? WHERE id = ?");
            $up->execute([$hash, $u['id']]);
        }
    }
}

function responseJSON($data, $statusCode = 200) {
    http_response_code($statusCode);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode($data);
    exit;
}

function getCurrentUser() {
    if (isset($_SESSION['mcares_user'])) {
        return $_SESSION['mcares_user'];
    }
    return null;
}

function requireLogin() {
    $user = getCurrentUser();
    if (!$user) {
        responseJSON(['status' => 'error', 'message' => 'Unauthorized. Session expired or not logged in.'], 401);
    }
    return $user;
}

function requireFounder() {
    $user = requireLogin();
    if ($user['role'] !== 'founder') {
        responseJSON(['status' => 'error', 'message' => 'Forbidden. Super Admin (Founder) permission required.'], 403);
    }
    return $user;
}

function logActivity($pdo, $action, $details = '') {
    $user = getCurrentUser();
    $userId = $user ? $user['id'] : null;
    $userName = $user ? $user['full_name'] : 'System / Guest';
    $ip = $_SERVER['REMOTE_ADDR'] ?? '127.0.0.1';

    try {
        $stmt = $pdo->prepare("INSERT INTO activity_logs (user_id, user_name, action, details, ip_address) VALUES (?, ?, ?, ?, ?)");
        $stmt->execute([$userId, $userName, $action, $details, $ip]);
    } catch (Exception $e) {
        // Silently continue if log table issue
    }
}
