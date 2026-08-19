<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
// Restrict to Founder only
$currentUser = requireFounder();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $stmt = $pdo->query("SELECT id, username, full_name, email, phone, role, status, last_login, created_at FROM users ORDER BY role ASC, full_name ASC");
    responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
}

if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $action = $_GET['action'] ?? 'add';

    if ($action === 'add') {
        $username = trim($input['username'] ?? '');
        $password = trim($input['password'] ?? '');
        $fullName = trim($input['full_name'] ?? '');
        $email = trim($input['email'] ?? '');
        $phone = trim($input['phone'] ?? '');
        $role = in_array($input['role'] ?? 'staff', ['founder', 'staff']) ? $input['role'] : 'staff';

        if (empty($username) || empty($password) || empty($fullName)) {
            responseJSON(['status' => 'error', 'message' => 'Username, Password, and Full Name are required.'], 400);
        }

        try {
            $hash = password_hash($password, PASSWORD_BCRYPT);
            $stmt = $pdo->prepare("INSERT INTO users (username, password, full_name, email, phone, role, status) VALUES (?, ?, ?, ?, ?, ?, 'active')");
            $stmt->execute([$username, $hash, $fullName, $email, $phone, $role]);

            logActivity($pdo, 'Create User Account', "Created user account '{$username}' with role '{$role}'");
            responseJSON(['status' => 'success', 'message' => "User account for {$fullName} created successfully!"]);
        } catch (PDOException $e) {
            responseJSON(['status' => 'error', 'message' => 'Username or email already exists.'], 400);
        }
    }

    if ($action === 'edit') {
        $id = (int)($input['id'] ?? 0);
        $fullName = trim($input['full_name'] ?? '');
        $email = trim($input['email'] ?? '');
        $phone = trim($input['phone'] ?? '');
        $role = in_array($input['role'] ?? 'staff', ['founder', 'staff']) ? $input['role'] : 'staff';
        $status = in_array($input['status'] ?? 'active', ['active', 'inactive']) ? $input['status'] : 'active';
        $password = trim($input['password'] ?? '');

        if ($id <= 0 || empty($fullName)) {
            responseJSON(['status' => 'error', 'message' => 'Invalid user details.'], 400);
        }

        if (!empty($password)) {
            $hash = password_hash($password, PASSWORD_BCRYPT);
            $stmt = $pdo->prepare("UPDATE users SET full_name=?, email=?, phone=?, role=?, status=?, password=? WHERE id=?");
            $stmt->execute([$fullName, $email, $phone, $role, $status, $hash, $id]);
        } else {
            $stmt = $pdo->prepare("UPDATE users SET full_name=?, email=?, phone=?, role=?, status=? WHERE id=?");
            $stmt->execute([$fullName, $email, $phone, $role, $status, $id]);
        }

        logActivity($pdo, 'Update User Account', "Updated user account ID {$id} ({$fullName})");
        responseJSON(['status' => 'success', 'message' => 'User account updated successfully!']);
    }

    if ($action === 'toggle_status') {
        $id = (int)($input['id'] ?? 0);
        if ($id === $currentUser['id']) {
            responseJSON(['status' => 'error', 'message' => 'Cannot deactivate your own active account.'], 400);
        }

        $stmt = $pdo->prepare("SELECT status, username FROM users WHERE id = ?");
        $stmt->execute([$id]);
        $targetUser = $stmt->fetch();

        if ($targetUser) {
            $newStatus = ($targetUser['status'] === 'active') ? 'inactive' : 'active';
            $up = $pdo->prepare("UPDATE users SET status = ? WHERE id = ?");
            $up->execute([$newStatus, $id]);

            logActivity($pdo, 'Toggle User Status', "Changed user status for '{$targetUser['username']}' to {$newStatus}");
            responseJSON(['status' => 'success', 'message' => "User status set to {$newStatus}."]);
        }
    }
}

if ($method === 'DELETE') {
    $id = (int)($_GET['id'] ?? 0);
    if ($id === $currentUser['id']) {
        responseJSON(['status' => 'error', 'message' => 'Cannot delete your own logged-in account.'], 400);
    }

    $stmt = $pdo->prepare("DELETE FROM users WHERE id = ?");
    $stmt->execute([$id]);

    logActivity($pdo, 'Delete User Account', "Deleted user account ID {$id}");
    responseJSON(['status' => 'success', 'message' => 'User account deleted.']);
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
