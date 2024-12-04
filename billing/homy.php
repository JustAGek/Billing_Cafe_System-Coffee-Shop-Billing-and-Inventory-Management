<?php 
include '../db_connect.php'; 

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Retrieve the data from the POST request
    $id = isset($_POST['id']) ? $_POST['id'] : null;
    $name = isset($_POST['name']) ? $_POST['name'] : '';
    $total_amount = isset($_POST['total_amount']) ? $_POST['total_amount'] : 0;

    // Check if the ID exists to determine if it's an insert or update operation
    if ($id) {
        // Update existing record
        $query = "UPDATE goods SET name = ?, total_amount = ?, date_created = CURRENT_TIMESTAMP WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('sdi', $name, $total_amount, $id);
    } else {
        // Insert new record
        $query = "INSERT INTO goods (name, total_amount) VALUES (?, ?)";
        $stmt = $conn->prepare($query);
        $stmt->bind_param('sd', $name, $total_amount);
    }

    if ($stmt->execute()) {
        echo "<script>alert('Goods Saved Successfully');</script>";
    } else {
        echo "<script>alert('Error saving goods');</script>";
    }

    $stmt->close();
    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Goods Details</title>
    <!-- Add custom styles for the form and layout -->
    <style>
        .btn-primary-gradient {
            background: linear-gradient(to right, #1e85ff 0%, #00a5fa 80%, #00e2fa 100%);
        }
        main .card {
            height: calc(100%);
        }
        main .card-body {
            height: calc(100%);
            overflow: auto;
            padding: 5px;
            position: relative;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container-fluid o-field">
    <div class="row mt-3 ml-3 mr-3">
        <div class="col-lg-12">
            <div class="card bg-dark border-primary">
                <div class="card-header text-white border-primary">
                    <b>Goods Details</b>
                    <span class="float-right">
                        <a class="btn btn-primary btn-sm" href="../index.php" id="home_button">
                            <i class="fa fa-home"></i> Home 
                        </a>
                    </span>
                </div>
                <div class="card-body">
                    <form action="" method="POST" id="manage-order">
                        <input type="hidden" name="id" value="<?php echo isset($_GET['id']) ? $_GET['id'] : '' ?>">

                        <!-- Name Field -->
                        <div class="d-flex w-100 bg-dark mb">
                            <label for="name" class="col-sm-4 text-white"><b>Name</b></label>
                            <input type="text" class="form-control-sm col-sm-8" name="name" id="name" value="<?php echo isset($name) ? $name : '' ?>" required>
                        </div>

                        <!-- Total Amount Input -->
                        <div class="d-flex w-100 bg-dark">
                            <label for="total_amount" class="col-sm-4 text-white"><b>Total Amount</b></label>
                            <input type="number" class="form-control-sm col-sm-8" name="total_amount" id="total_amount" value="<?php echo isset($total_amount) ? $total_amount : '' ?>" required>
                        </div>
                    </form>
                </div>
                <div class="card-footer bg-dark border-primary">
                    <div class="row justify-content-center">
                        <button class="btn btn btn-sm col-sm-3 btn-primary mr-2" type="submit" form="manage-order">Save</button>
                    </div>
                </div>
            </div>                  
        </div>
    </div>
</div>

</body>
</html>
