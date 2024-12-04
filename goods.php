<?php include('db_connect.php');?>
<style>
	input[type=checkbox] {
	  /* Double-sized Checkboxes */
	  -ms-transform: scale(1.3); /* IE */
	  -moz-transform: scale(1.3); /* FF */
	  -webkit-transform: scale(1.3); /* Safari and Chrome */
	  -o-transform: scale(1.3); /* Opera */
	  transform: scale(1.3);
	  padding: 10px;
	  cursor: pointer;
	}
</style>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row mb-4 mt-4">
			<div class="col-md-12"></div>
		</div>
		<div class="row">
			<!-- FORM Panel -->

			<!-- Table Panel -->
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>List of Goods</b>
					</div>
					<div class="card-body">
						<table class="table table-condensed table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="text-center">Date Created</th>
									<th class="text-center">Customer Name</th>
									<th class="text-center">Total Amount</th>
									<th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$order = $conn->query("SELECT * FROM goods ORDER BY unix_timestamp(date_created) DESC");
								while($row=$order->fetch_assoc()):
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class="text-center"><?php echo date("d-m-Y h:i:sa", strtotime($row['date_created'])) ?></td>
									<td class="text-center"><?php echo $row['name'] ?></td>
									<td class="text-center"><?php echo number_format($row['total_amount'], 2) ?></td>
									<td class="text-center">
										<button class="btn btn-sm btn-outline-danger delete_order" type="button" data-id="<?php echo $row['id'] ?>">Delete</button>
									</td>
								</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	
</div>
<style>
	td {
		vertical-align: middle !important;
	}
	td p {
		margin: unset;
	}
	img {
		max-width: 100px;
		max-height: 150px;
	}
</style>
<script>
	$(document).ready(function(){
		$('table').dataTable();
	});

	$('.delete_order').click(function(){
		let id = $(this).attr('data-id');
		_conf("Are you sure to delete this good?", "delete_order_confirm", [id]);
	});

	function delete_order_confirm(id){
		start_load();
		$.ajax({
			url: 'goods.php',  // Replace with your current PHP file's name
			method: 'POST',
			data: { id: id, delete_order: true },
		});
	}
</script>

<?php
if(isset($_POST['delete_order'])){
	$id = $_POST['id'];
	$delete = $conn->query("DELETE FROM goods WHERE id = $id");
	if($delete){
		echo 1;
		exit;
	}
}
?>
