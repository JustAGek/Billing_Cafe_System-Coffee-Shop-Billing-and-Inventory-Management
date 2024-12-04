<?php
include 'db_connect.php';

// Default month filter
$monthFilter = isset($_GET['month']) ? $_GET['month'] : '';

$sql = "SELECT name, phone_no, BirthDate FROM orders WHERE name IS NOT NULL AND name != '' AND phone_no IS NOT NULL AND phone_no != '' AND BirthDate IS NOT NULL";

$clients = $conn->query($sql);
$filteredClients = [];

if ($clients->num_rows > 0) {
    while($row = $clients->fetch_array()) {
        $birthMonth = date('m', strtotime($row['BirthDate']));
        if (empty($monthFilter) || $monthFilter == $birthMonth) {
            $filteredClients[] = $row;
        }
    }
}
?>

<div class="container-fluid">
    <div class="col-lg-12">
        <div class="card">
            <div class="card_body">
                <div class="row justify-content-center pt-4">
                    <label for="" class="mt-2">Select Month</label>
                    <div class="col-sm-6">
                        <select name="month" id="month" class="form-control">
                            <option value="">All Months</option>
                            <?php for($m=1; $m<=12; $m++): ?>
                                <option value="<?php echo sprintf('%02d', $m); ?>" <?php echo ($monthFilter == sprintf('%02d', $m)) ? 'selected' : ''; ?>>
                                    <?php echo date('F', mktime(0, 0, 0, $m, 10)); ?>
                                </option>
                            <?php endfor; ?>
                        </select>
                    </div>
                    <div class="col-sm-2">
                        <button id="filter-btn" class="btn btn-primary">Filter</button>
                    </div>
                </div>
                <hr>
                <div class="col-md-12">
                    <table class="table table-bordered" id='client-list'>
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th>Name</th>
                                <th>Phone Number</th>
                                <th>Birth Date</th>
                            </tr>
                        </thead>
                        <tbody>
                        <?php
                        $i = 1;
                        if(count($filteredClients) > 0):
                            foreach($filteredClients as $row):
                                $day = date('d', strtotime($row['BirthDate']));
                                $month = date('m', strtotime($row['BirthDate']));
                                $year = date('Y', strtotime($row['BirthDate']));
                        ?>
                        <tr>
                            <td class="text-center"><?php echo $i++ ?></td>
                            <td>
                                <p> <b><?php echo $row['name'] ?></b></p>
                            </td>
                            <td>
                                <p> <b><?php echo $row['phone_no'] ?></b></p>
                            </td>
                            <td>
                                <p> <b><?php echo $day . '-' . $month . '-' . $year ?></b></p>
                            </td>
                        </tr>
                        <?php 
                            endforeach;
                            else:
                        ?>
                        <tr>
                            <th class="text-center" colspan="4">No Data.</th>
                        </tr>
                        <?php 
                            endif;
                        ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
$('#filter-btn').click(function(){
    var month = $('#month').val();
    location.replace('index.php?page=birthday_report&month='+encodeURIComponent(month));
});

$('#month').change(function(){
    $('#filter-btn').click();
});
</script>
