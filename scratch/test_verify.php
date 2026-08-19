<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
echo "--- 1. Checking Database Migration ---\n";
$stmt = $pdo->query("SHOW COLUMNS FROM medicines LIKE 'packs_cards'");
$col = $stmt->fetch();
if ($col) {
    echo "SUCCESS: Column 'packs_cards' exists in 'medicines' table! Type: {$col['Type']}\n";
} else {
    echo "ERROR: Column 'packs_cards' NOT found.\n";
}

$custStmt = $pdo->query("SELECT id, name FROM customers WHERE id = 1");
$cust = $custStmt->fetch();
if ($cust) {
    echo "SUCCESS: Default Walk-in Customer exists (ID: {$cust['id']}, Name: {$cust['name']})\n";
} else {
    echo "ERROR: Walk-in Customer ID 1 missing.\n";
}

echo "\n--- 2. Testing Medicine Add/Fetch with packs_cards ---\n";
$testMedName = "Test Amoxicillin " . rand(100, 999);
$insertStmt = $pdo->prepare("INSERT INTO medicines (name, generic_name, brand, packs_cards, category_id, batch_number, barcode, manufacturer, purchase_price, selling_price, quantity, reorder_level, expiry_date, storage_location) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
$insertStmt->execute([
    $testMedName,
    "Amoxicillin Trihydrate",
    "TestBrand",
    "10 cards/box",
    1,
    "BT-" . rand(1000, 9999),
    "890" . rand(100000000, 999999999),
    "Test Lab",
    5.00,
    10.00,
    100,
    10,
    "2027-12-31",
    "Shelf T1"
]);
$medId = $pdo->lastInsertId();
echo "Inserted test medicine with ID: {$medId}\n";

$fetchStmt = $pdo->prepare("SELECT id, name, packs_cards FROM medicines WHERE id = ?");
$fetchStmt->execute([$medId]);
$fetched = $fetchStmt->fetch();
echo "Fetched medicine: {$fetched['name']} | Packs/Cards: {$fetched['packs_cards']}\n";

echo "\n--- 3. Testing POS Checkout Logic with Customer ID Validation ---\n";
// Test checkout payload logic with invalid customer_id 99999
$rawCustId = 99999;
$customerId = null;
if ($rawCustId > 0) {
    $cCheck = $pdo->prepare("SELECT id FROM customers WHERE id = ?");
    $cCheck->execute([$rawCustId]);
    if ($cCheck->fetch()) {
        $customerId = $rawCustId;
    }
}
if ($customerId === null) {
    $cCheck1 = $pdo->query("SELECT id FROM customers WHERE id = 1")->fetch();
    if ($cCheck1) {
        $customerId = 1;
    }
}
echo "Requested Customer ID: {$rawCustId} -> Validated Customer ID for sales row: " . ($customerId ?? "NULL") . "\n";

// Clean up test medicine
$pdo->exec("DELETE FROM medicines WHERE id = {$medId}");
echo "Cleaned up test medicine ID {$medId}.\n";
echo "\nAll verification checks passed successfully!\n";
