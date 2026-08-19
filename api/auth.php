<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$action = $_GET['action'] ?? '';

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action === 'login') {
    $input = json_decode(file_get_contents('php://input'), true);
    $username = trim($input['username'] ?? '');
    $password = trim($input['password'] ?? '');

    if (empty($username) || empty($password)) {
        responseJSON(['status' => 'error', 'message' => 'Please enter username and password.'], 400);
    }

    $stmt = $pdo->prepare("SELECT * FROM users WHERE username = ? LIMIT 1");
    $stmt->execute([$username]);
    $user = $stmt->fetch();

    if ($user && password_verify($password, $user['password'])) {
        if ($user['status'] !== 'active') {
            responseJSON(['status' => 'error', 'message' => 'Account is deactivated. Contact Founder.'], 403);
        }

        // Update last login
        $up = $pdo->prepare("UPDATE users SET last_login = NOW() WHERE id = ?");
        $up->execute([$user['id']]);

        $userData = [
            'id' => (int)$user['id'],
            'username' => $user['username'],
            'full_name' => $user['full_name'],
            'email' => $user['email'],
            'phone' => $user['phone'],
            'role' => $user['role']
        ];

        $_SESSION['mcares_user'] = $userData;
        logActivity($pdo, 'User Login', 'User logged in successfully.');

        responseJSON([
            'status' => 'success',
            'message' => 'Login successful! Welcome to MCPMS.',
            'user' => $userData
        ]);
    } else {
        logActivity($pdo, 'Failed Login Attempt', "Failed login attempt for username: {$username}");
        responseJSON(['status' => 'error', 'message' => 'Invalid username or password.'], 401);
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && $action === 'logout') {
    logActivity($pdo, 'User Logout', 'User logged out.');
    unset($_SESSION['mcares_user']);
    session_destroy();
    responseJSON(['status' => 'success', 'message' => 'Logged out successfully.']);
}

if ($_SERVER['REQUEST_METHOD'] === 'GET' && $action === 'check') {
    $user = getCurrentUser();
    if ($user) {
        responseJSON(['status' => 'success', 'logged_in' => true, 'user' => $user]);
    } else {
        responseJSON(['status' => 'success', 'logged_in' => false]);
    }
}

responseJSON(['status' => 'error', 'message' => 'Invalid request action.'], 400);
