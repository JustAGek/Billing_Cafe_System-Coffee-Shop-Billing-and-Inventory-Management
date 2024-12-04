<?php
include '../db_connect.php';

if(isset($_POST['phone_number'])){
    $phone_number = $_POST['phone_number'];
    $query = $conn->query("SELECT name, BirthDate FROM orders WHERE phone_no = '$phone_number' LIMIT 1");

    if($query->num_rows > 0){
        $customer = $query->fetch_assoc();
        echo json_encode(['status' => 'success', 'data' => $customer]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Customer not found']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request']);
}
?>
