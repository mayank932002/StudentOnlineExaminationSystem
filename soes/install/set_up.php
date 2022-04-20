
<?php

$message = '';

error_reporting(0);

if(file_exists('credential.inc'))
{
	include('credential.inc');
	try
	{
		$connect = new PDO("mysql:host=$gdb_host;dbname=$gdb_name", $gdb_user_name, $gdb_password);
		$connect->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION, PDO::ERRMODE_WARNING);
		
		header('location:'.$gbase_url.'admin/index.php');

	}
	catch(PDOException $e)
	{
		$message = 'Set Mysql Database Configuration Details';
	}
}
else
{
	$message = 'Set Mysql Database Configuration Details';
}


if(isset($_POST["submit"]))
{
	$database_name = $_POST["database_name"];
	$database_username = $_POST["database_user_name"];
	$database_password = $_POST["database_password"];
	$database_host = $_POST["database_host"];
	$base_url = $_POST["base_url"];

	$string = '
	<?php 
		$gdb_name = "'.$database_name.'";
		$gdb_user_name = "'.$database_username.'";
		$gdb_password = "'.$database_password.'";
		$gdb_host = "'.$database_host.'";
		$gbase_url = "'.$base_url.'";
	?>
	';

	if(file_put_contents('credential.inc', $string))
	{
		header('location:'.$base_url.'admin/index.php');
	}

}	

?>

<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Online Student Exam Management System in PHP</title>

	    <!-- Custom styles for this page -->
	    <link href="../vendor/bootstrap/bootstrap.min.css" rel="stylesheet">

	    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

	    <!-- Custom styles for this page -->
    	<link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

	    <link rel="stylesheet" type="text/css" href="../vendor/parsley/parsley.css"/>
	    <link rel="stylesheet" type="text/css" href="../vendor/TimeCircle/TimeCircles.css"/>
	    <style>
	    	.border-top { border-top: 1px solid #e5e5e5; }
			.border-bottom { border-bottom: 1px solid #e5e5e5; }

			.box-shadow { box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05); }
	    </style>
	</head>
	<body>
		<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
		    <h5 class="my-0 mr-md-auto font-weight-normal">Webslesson</h5>
		    
	    </div>

	    <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
	      	<h1 class="display-4">Online Student Exam Management System</h1>
	    </div>
	    <div class="container-fluid">
		    <div class="container">
			    <div class="card mt-4 mb-4">
			      	<div class="card-header"><b><?php echo $message; ?></b></div>
			      	<div class="cart-body col-sm-12">
			      		<form method="post" class="mt-4 mb-4" id="set_up_form">
			      			<div class="form-group row">
						    	<label for="database_name" class="col-sm-2 col-form-label"><b>Database Name</b></label>
						    	<div class="col-sm-4">
						      		<input type="text" name="database_name" class="form-control" id="database_name" required data-parsley-trigger="keyup">
						    	</div>
						    	<div class="col-sm-6 text-muted">The Name of Database you want to use with this Examination System</div>
						  	</div>
						  	<div class="form-group row">
						    	<label for="database_user_name" class="col-sm-2 col-form-label"><b>Database Username</b></label>
						    	<div class="col-sm-4">
						      		<input type="text" name="database_user_name" class="form-control" id="database_user_name" required data-parsley-trigger="keyup">
						    	</div>
						    	<div class="col-sm-6 text-muted">Your Database Username</div>
						  	</div>
						  	<div class="form-group row">
						    	<label for="database_password" class="col-sm-2 col-form-label"><b>Database Password</b></label>
						    	<div class="col-sm-4">
						      		<input type="text" name="database_password" class="form-control" id="database_password">
						    	</div>
						    	<div class="col-sm-6 text-muted">Your Database Password</div>
						  	</div>
						  	<div class="form-group row">
						    	<label for="database_host" class="col-sm-2 col-form-label"><b>Database Host</b></label>
						    	<div class="col-sm-4">
						      		<input type="text" name="database_host" class="form-control" id="database_host" required data-parsley-trigger="keyup">
						    	</div>
						    	<div class="col-sm-6 text-muted">Your Database Host Name</div>
						  	</div>
						  	<div class="form-group row">
						    	<label for="base_url" class="col-sm-2 col-form-label"><b>Base Url</b></label>
						    	<div class="col-sm-4">
						      		<input type="text" name="base_url" class="form-control" id="base_url" required data-parsley-trigger="keyup">
						    	</div>
						    	<div class="col-sm-6 text-muted">Define Base Url of Online Examination System</div>
						  	</div>
						  	<div class="form-group mt-5">
						  		<input type="submit" name="submit" id="submit_button" class="btn btn-primary" value="Submit" />
						  	</div>
			      		</form>
			      	</div>
			    </div>
			</div>
		</div>
		<!-- Bootstrap core JavaScript-->
	    <script src="../vendor/jquery/jquery.min.js"></script>
	    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	    <script src="../vendor/datatables/jquery.dataTables.min.js"></script>
    	<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>

	    <!-- Core plugin JavaScript-->
	    <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

	    <script type="text/javascript" src="../vendor/parsley/dist/parsley.min.js"></script>

	    <script type="text/javascript" src="../vendor/TimeCircle/TimeCircles.js"></script>

	</body>
</html>

<script>

$(document).ready(function(){

	$('#set_up_form').parsley();

	if($('#set_up_form').parsley().isValid())
	{
		$('#submit_button').attr('disabled', disabled);
		$('#submit_button').val('Wait...');
		return true;
	}
	else
	{
		return false;
	}

});

</script>