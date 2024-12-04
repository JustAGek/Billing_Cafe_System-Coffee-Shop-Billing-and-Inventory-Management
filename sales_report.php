<?php
include 'db_connect.php';

// Default date range
$dateRange = isset($_GET['date_range']) ? $_GET['date_range'] : 'month';
$month = isset($_GET['month']) ? $_GET['month'] : date('Y-m');
$day = isset($_GET['day']) ? $_GET['day'] : date('Y-m-d');
$time = isset($_GET['time']) ? $_GET['time'] : date('Y-m-d H:i');
$week = isset($_GET['week']) ? $_GET['week'] : date('Y-\WW');
$year = isset($_GET['year']) ? $_GET['year'] : date('Y');

$filterCondition = '';

switch ($dateRange) {
    case 'day':
        $filterCondition = "DATE(date_created) = '$day'";
        break;
    case 'time':
        $filterCondition = "DATE_FORMAT(date_created, '%Y-%m-%d %H:%i') = '$time'";
        break;
    case 'week':
        $weekStart = date('Y-m-d', strtotime($week));
        $weekEnd = date('Y-m-d', strtotime($week . ' +6 days'));
        $filterCondition = "DATE(date_created) BETWEEN '$weekStart' AND '$weekEnd'";
        break;
    case 'month':
        $filterCondition = "DATE_FORMAT(date_created, '%Y-%m') = '$month'";
        break;
    case 'year':
        $filterCondition = "YEAR(date_created) = '$year'";
        break;
}

// Calculate totals
$am_total = 0;
$pm_total = 0;
$overall_total = 0;

$sales = $conn->query("SELECT * FROM orders WHERE $filterCondition");

if ($sales->num_rows > 0) {
    while ($row = $sales->fetch_array()) {
        $order_time = date('H:i:s', strtotime($row['date_created']));
        $total_amount = $row['Final_amount'];
        $overall_total += $total_amount;

        if ($order_time < '17:00:00') {
            $am_total += $total_amount;
        } else {
            $pm_total += $total_amount;
        }
    }
}
?>

<div class="container-fluid">
    <div class="col-lg-12">
        <div class="card">
            <div class="card_body">
                <div class="row justify-content-center pt-4">
                    <label for="" class="mt-2">Date Range</label>
                    <div class="col-sm-3">
                        <select name="date_range" id="date_range" class="form-control">
                            <option value="day" <?php echo $dateRange == 'day' ? 'selected' : '' ?>>Day</option>
                            <option value="time" <?php echo $dateRange == 'time' ? 'selected' : '' ?>>Time</option>
                            <option value="week" <?php echo $dateRange == 'week' ? 'selected' : '' ?>>Week</option>
                            <option value="month" <?php echo $dateRange == 'month' ? 'selected' : '' ?>>Month</option>
                            <option value="year" <?php echo $dateRange == 'year' ? 'selected' : '' ?>>Year</option>
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <input type="date" name="day" id="day" value="<?php echo $day ?>" class="form-control date-range-input <?php echo $dateRange == 'day' ? '' : 'd-none' ?>">
                        <input type="datetime-local" name="time" id="time" value="<?php echo $time ?>" class="form-control date-range-input <?php echo $dateRange == 'time' ? '' : 'd-none' ?>">
                        <input type="week" name="week" id="week" value="<?php echo $week ?>" class="form-control date-range-input <?php echo $dateRange == 'week' ? '' : 'd-none' ?>">
                        <input type="month" name="month" id="month" value="<?php echo $month ?>" class="form-control date-range-input <?php echo $dateRange == 'month' ? '' : 'd-none' ?>">
                        <input type="number" name="year" id="year" value="<?php echo $year ?>" class="form-control date-range-input <?php echo $dateRange == 'year' ? '' : 'd-none' ?>" min="2000" max="<?php echo date('Y') ?>">
                    </div>
                </div>
                <hr>
                <div class="col-md-12">
                    <table class="table table-bordered" id='report-list'>
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="">Date</th>
                                <th class="">Invoice</th>
                                <th class="">Order Number</th>
                                <th class="">Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $i = 1;
                        if($sales->num_rows > 0):
                        $sales->data_seek(0); // Reset pointer to start
                        while($row = $sales->fetch_array()):
                        ?>
                        <tr>
                            <td class="text-center"><?php echo $i++ ?></td>
                            <td>
                                <p> <b><?php echo date("M d, Y H:i",strtotime($row['date_created'])) ?></b></p>
                            </td>
                            <td>
                                <p> <b><?php echo $row['amount_tendered'] >= 0 ? $row['ref_no'] : 'N/A' ?></b></p>
                            </td>
                            <td>
                                <p> <b><?php echo $row['order_number'] ?></b></p>
                            </td>
                            <td>
                                <p class="text-right"> <b><?php echo number_format($row['total_amount'],2) ?></b></p>
                            </td>
                        </tr>
                        <?php 
                            endwhile;
                            else:
                        ?>
                        <tr>
                                <th class="text-center" colspan="5">No Data.</th>
                        </tr>
                        <?php 
                            endif;
                        ?>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th colspan="4" class="text-right">A.M. Total</th>
                                <th class="text-right"><?php echo number_format($am_total, 2) ?></th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-right">P.M. Total</th>
                                <th class="text-right"><?php echo number_format($pm_total, 2) ?></th>
                            </tr>
                            <tr>
                                <th colspan="4" class="text-right">Overall Total</th>
                                <th class="text-right"><?php echo number_format($overall_total, 2) ?></th>
                            </tr>
                        </tfoot>
                    </table>
                    <hr>
                    <div class="col-md-12 mb-4">
                        <center>
                            <button class="btn btn-success btn-sm col-sm-3" type="button" id="print"><i class="fa fa-print"></i> Print</button>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<noscript>
    <style>
        table#report-list{
            width:100%;
            border-collapse:collapse
        }
        table#report-list td,table#report-list th{
            border:1px solid
        }
        p{
            margin:unset;
        }
        .text-center{
            text-align:center
        }
        .text-right{
            text-align:right
        }
    </style>
</noscript>
<script>
$('#date_range').change(function(){
    $('.date-range-input').addClass('d-none');
    $('#' + $(this).val()).removeClass('d-none');
});

$('.date-range-input').change(function(){
    var dateRange = $('#date_range').val();
    var selectedDate = $(this).val();
    location.replace('index.php?page=sales_report&date_range='+dateRange+'&'+dateRange+'='+selectedDate)
});

$('#print').click(function(){
    var _c = $('#report-list').clone();
    var ns = $('noscript').clone();
    ns.append(_c)
    var nw = window.open('','_blank','width=900,height=600')
    nw.document.write('<p class="text-center"><b>Order Report as of <?php echo date("F, Y",strtotime($month)) ?></b></p>')
    nw.document.write(ns.html())
    nw.document.close()
    nw.print()
    setTimeout(() => {
        nw.close()
    }, 500);
})
</script>
