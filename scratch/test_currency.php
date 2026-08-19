<?php
require_once __DIR__ . '/../config/db.php';
$pdo = getDBConnection();
$stmt = $pdo->query("SELECT setting_key, setting_value FROM settings WHERE setting_key = 'currency_symbol'");
echo json_encode($stmt->fetch());
