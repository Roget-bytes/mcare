<?php
require_once __DIR__ . '/../config/db.php';

$pdo = getDBConnection();
$user = requireLogin();
$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'GET') {
    $rxId = isset($_GET['id']) ? (int)$_GET['id'] : 0;

    if ($rxId > 0) {
        $stmt = $pdo->prepare("SELECT rx.*, u.full_name as created_by_name FROM prescriptions rx JOIN users u ON rx.created_by = u.id WHERE rx.id = ?");
        $stmt->execute([$rxId]);
        $rx = $stmt->fetch();

        if (!$rx) {
            responseJSON(['status' => 'error', 'message' => 'Prescription not found.'], 404);
        }

        $itemsStmt = $pdo->prepare("SELECT pi.*, m.name as medicine_name, m.generic_name, m.brand, m.selling_price, m.quantity as stock_qty, m.barcode FROM prescription_items pi JOIN medicines m ON pi.medicine_id = m.id WHERE pi.prescription_id = ?");
        $itemsStmt->execute([$rxId]);
        $rx['items'] = $itemsStmt->fetchAll();

        responseJSON(['status' => 'success', 'data' => $rx]);
    } else {
        $search = trim($_GET['search'] ?? '');
        $sql = "SELECT rx.*, u.full_name as created_by_name, COUNT(pi.id) as item_count 
                FROM prescriptions rx 
                JOIN users u ON rx.created_by = u.id 
                LEFT JOIN prescription_items pi ON rx.id = pi.prescription_id 
                WHERE 1=1";
        $params = [];

        if (!empty($search)) {
            $sql .= " AND (rx.rx_number LIKE ? OR rx.patient_name LIKE ? OR rx.doctor_name LIKE ?)";
            $term = "%{$search}%";
            $params = [$term, $term, $term];
        }

        $sql .= " GROUP BY rx.id ORDER BY rx.created_at DESC";
        $stmt = $pdo->prepare($sql);
        $stmt->execute($params);

        responseJSON(['status' => 'success', 'data' => $stmt->fetchAll()]);
    }
}

if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);
    $action = $_GET['action'] ?? 'add';

    if ($action === 'add') {
        $patientName = trim($input['patient_name'] ?? '');
        $patientAge = !empty($input['patient_age']) ? (int)$input['patient_age'] : null;
        $patientGender = in_array($input['patient_gender'] ?? 'Male', ['Male', 'Female', 'Other']) ? $input['patient_gender'] : 'Male';
        $doctorName = trim($input['doctor_name'] ?? '');
        $hospitalClinic = trim($input['hospital_clinic'] ?? '');
        $notes = trim($input['notes'] ?? '');
        $items = $input['items'] ?? [];

        if (empty($patientName) || empty($doctorName) || empty($items)) {
            responseJSON(['status' => 'error', 'message' => 'Patient name, Doctor name, and Prescribed medicines are required.'], 400);
        }

        try {
            $pdo->beginTransaction();

            $rxNumber = 'RX-' . date('Y') . '-' . rand(100, 999);

            $stmt = $pdo->prepare("INSERT INTO prescriptions (rx_number, patient_name, patient_age, patient_gender, doctor_name, hospital_clinic, status, notes, created_by) VALUES (?, ?, ?, ?, ?, ?, 'pending', ?, ?)");
            $stmt->execute([$rxNumber, $patientName, $patientAge, $patientGender, $doctorName, $hospitalClinic, $notes, $user['id']]);
            $rxId = $pdo->lastInsertId();

            foreach ($items as $item) {
                $medId = (int)$item['medicine_id'];
                $dosage = trim($item['dosage'] ?? '1 tab');
                $frequency = trim($item['frequency'] ?? 'Daily');
                $duration = trim($item['duration'] ?? '7 days');
                $qty = (int)($item['quantity'] ?? 1);

                $piStmt = $pdo->prepare("INSERT INTO prescription_items (prescription_id, medicine_id, dosage, frequency, duration, quantity) VALUES (?, ?, ?, ?, ?, ?)");
                $piStmt->execute([$rxId, $medId, $dosage, $frequency, $duration, $qty]);
            }

            $pdo->commit();

            logActivity($pdo, 'New Prescription', "Created Prescription {$rxNumber} for Patient {$patientName}");
            responseJSON(['status' => 'success', 'message' => 'Prescription recorded successfully!', 'rx_number' => $rxNumber]);
        } catch (Exception $e) {
            $pdo->rollBack();
            responseJSON(['status' => 'error', 'message' => $e->getMessage()], 400);
        }
    }

    if ($action === 'update_status') {
        $rxId = (int)($input['id'] ?? 0);
        $status = in_array($input['status'] ?? 'pending', ['pending', 'dispensed', 'cancelled']) ? $input['status'] : 'pending';

        $stmt = $pdo->prepare("UPDATE prescriptions SET status = ? WHERE id = ?");
        $stmt->execute([$status, $rxId]);

        logActivity($pdo, 'Prescription Status Update', "Updated Prescription ID {$rxId} status to {$status}");
        responseJSON(['status' => 'success', 'message' => 'Prescription status updated.']);
    }
}

responseJSON(['status' => 'error', 'message' => 'Method not allowed.'], 405);
