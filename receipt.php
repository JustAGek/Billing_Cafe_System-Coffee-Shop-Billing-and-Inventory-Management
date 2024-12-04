<?php 
include 'db_connect.php';
$order = $conn->query("SELECT * FROM orders where id = {$_GET['id']}");
foreach($order->fetch_array() as $k => $v){
    $$k = $v;
}
$items = $conn->query("SELECT o.*,p.name FROM order_items o inner join products p on p.id = o.product_id where o.order_id = $id ");

// Get the current day and month
$currentDayMonth = date("d-m");
// Get the birthdate day and month from the order
$birthDayMonth = date("d-m", strtotime($BirthDate));

// Check if today is the user's birthday
$isBirthday = ($currentDayMonth == $birthDayMonth);
?>

<style>
    .container-fluid {
        width: 100%;
        margin: auto;
    }
    .flex {
        display: inline-flex;
        width: 100%;
    }
    .w-50 {
        width: 50%;
    }
    .text-left {
        text-align: left;
    }
    .text-center {
        text-align: center;
    }
    .text-right {
        text-align: right;
    }
    table.wborder {
        width: 100%;
        border-collapse: collapse;
    }
    table.wborder>tbody>tr, table.wborder>tbody>tr>td {
        border: 0px solid;
    }
    p {
        margin: unset;
    }
    .banner {
        width: 100%;
        text-align: center;
    }
    .banner img {
        max-width: 100%;
        height: auto;
    }
    .order-header {
        display: flex;
        justify-content: space-between;
        font-weight: bold;
    }
    .order-header div {
        width: 33%;
    }
    .dashed-line {
        border: none;
        border-top: 1px dashed #000;
        margin: 10px 0;
    }
</style>

<div class="banner">
    <img src="image.jpg" alt="Banner Image">
</div>

<div class="container-fluid">
    <p class="text-center"><b><?php echo $amount_tendered > 0 ? "Receipt" : "Receipt" ?></b></p>
    <p>Invoice Number: <b><?php echo $ref_no ?></b></p>
    <p>Name: <b><?php echo $name?></b></p>
    <p>BirthDate: <b><?php echo date("d-m-Y", strtotime($BirthDate))?></b></p>
    <hr>
    <div class="flex">
        <div class="w-100">
            <p>Date: <b><?php echo date("M d, Y",strtotime($date_created)) ?></b></p>
        </div>
    </div>
    <hr>
    <div class="order-header">
        <div>QTY</div>
        <div class="text-right">Amount</div>
    </div>
    <hr>
    <table width="100%">
    <tbody>
            <?php 
            while($row = $items->fetch_assoc()):
            ?>
            <tr>
                <td class = "text-left"><?php echo $row['qty'] ?></td>
                <td class = "text-center"><?php echo $row['name'] ?></p><?php if($row['qty'] > 0): ?><small>(<?php echo number_format($row['price'],2) ?>)</small> <?php endif; ?></td>
                <td class=  "text-right"><?php echo number_format($row['amount'],2) ?></td>
            </tr>
            <tr>
                <td colspan="3"><hr class="dashed-line"></td>
            </tr>
            <?php endwhile; ?>
    </tbody>
    </table>
    <hr>
    <table width="100%">
        <tbody>
            <tr>
                <td><b>Total Amount</b></td>
                <td class="text-right"><b><?php echo number_format($Final_amount,2) ?></b></td>
                
            </tr>
        </tbody>
    </table>
    <hr>
    <p class="text-center"><b>Order No.</b></p>
    <h4 class="text-center"><b><?php echo $order_number ?></b></h4>
    <?php if ($isBirthday): ?>
        <h4 class="text-center"><b>Happy Birthday to You : <?php echo $name ?> ! </b></h4>
        <div class="banner">
    <img src="images.png" alt="Banner Image">

</div>
    <?php endif; ?>
    
</div>
<div class="QR">
    <img src="QR.png" alt="QR">
</div>