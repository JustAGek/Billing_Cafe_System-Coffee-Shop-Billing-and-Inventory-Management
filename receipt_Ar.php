<?php 
include 'db_connect.php';
$order = $conn->query("SELECT * FROM orders where id = {$_GET['id']}");
foreach($order->fetch_array() as $k => $v){
    $$k = $v;
}
$items = $conn->query("SELECT o.*,p.name_ar FROM order_items o inner join products p on p.id = o.product_id where o.order_id = $id");
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

<p>ملاحظة:  <b><?php echo $Comment?></b></p>
<div class="container-fluid">
    <hr>
    <div class="order-header">
        <div>كمية</div>
    </div>
    <hr>
    <table width="100%">
    <tbody>
            <?php 
            while($row = $items->fetch_assoc()):
            ?>
            <tr>
                <td class = "text-left"><?php echo $row['qty'] ?></td>
                <td class = "text-center"><?php echo $row['name_ar'] ?></p></td>
            </tr>
            <tr>
                <td colspan="3"><hr class="dashed-line"></td>
            </tr>
            <?php endwhile; ?>
    </tbody>
    </table>
    <hr>
    <p class="text-center"><b>Order No.</b></p>
    <h4 class="text-center"><b><?php echo $order_number ?></b></h4>
</div>
