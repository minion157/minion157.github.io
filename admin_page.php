<?php
    session_start();
    if(!isset($_SESSION['email_address']))
		header('location:index.php');
	
	include('connection.php');

	$username = $_SESSION['username'];
	$sql = "SELECT * FROM user WHERE username = '$username' ";
	$result = mysqli_query($conn,$sql);

	$row = mysqli_fetch_array($result);
	$user_id = $row['user_id'];

    $sql = "SELECT * FROM upload_albums ORDER BY song_id ASC";
	$result = mysqli_query($conn,$sql);

	while($rows = mysqli_fetch_array($result)){
		$song_id = $rows['song_id'];
		if(isset($_POST[$song_id])){

			$sql = "SELECT * FROM upload_albums WHERE song_id = '$song_id' ";
			$results = mysqli_query($conn,$sql);

			$row = mysqli_fetch_array($results);
			$song_id = $row['song_id'];
			$song_name = $row['song_name'];

			$sql = "DELETE FROM upload_albums WHERE song_name = '$song_name' ";
			$results = mysqli_query($conn,$sql);

			if($results){
				echo '<script type="text/javascript">';
                echo 'setTimeout(function () { sweetAlert("Deleted"," <b>Song '.$song_name.' is deleted from uploaded songs</b>","success");';
				echo '}, 500);</script>';
			}else{
				echo '<script type="text/javascript">';
            	echo 'setTimeout(function () { sweetAlert("Oops...","<b> Error while deleting.Please check your internet coonection!</b>","error");';
            	echo '}, 500);</script>';
			}
        }
    }

?>

<!DOCTYPE HTML>
<html>

<head>
	<title>Cadenza | Admin Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
	<link rel="icon" href="images/i1.png" />
    <!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
	<!-- Material Design Bootstrap -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.14/css/mdb.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="css/style.css" rel='stylesheet' type='text/css' />
	<!-- font-awesome icons -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- //Custom Theme files -->
	<!--webfonts-->
	<link href="//fonts.googleapis.com/css?family=Ubuntu:300,300i,400,400i,500,500i,700,700i" rel="stylesheet">
	<!--//webfonts-->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.28.11/dist/sweetalert2.min.css">
</head>

<body>
	<!-- header -->
	<header>
		<div class="container">
			<nav class="navbar navbar-expand-lg navbar-light">
				<a class="navbar-brand" href="#">
					Cadenza
                </a>
                <pre>                 </pre>
                <li class="nav-item">
					<b style="font-size:20px;"><p style="color:blue;"><?php echo "Logged in as ".$_SESSION['username'];?></p></b>
                    <p style="color:blue;">| Admin Page |</p>
                </li>
                <li class="nav-item">
                    <a class="nav-link scroll" href="logout.php">           <b>logout</b></a>
                </li>
			</nav>
		</div>
	</header>
	<!-- //header -->
	
   <br> <div class="alert alert-primary" role="alert">
     <center><b>List of all users</b></center>
    </div>
    <?php 

        include('connection.php');

        $sql = "SELECT * FROM user order by user_id";
        $result = mysqli_query($conn,$sql);

        echo "
            <div class='card'>
                <h3 class='card-header text-center font-weight-bold text-uppercase py-4'>Users List</h3>
                <div class='card-body'>
                    <div id='table' class='table-editable'>
                        <table class='table table-bordered table-responsive-md table-striped text-center'>
                            <tr>
                                <th class='text-center'>User id</th>
                                <th class='text-center'>User Name</th>
                                <th class='text-center'>Email Address</th>
                                <th class='text-center'>Mobile Number</th>
                                <th class='text-center'>Password</th>
                               
                            </tr>
            ";
            while($row = mysqli_fetch_array($result)){

                echo "
                        <tr>
                            <td class='pt-3-half' >".$row['user_id']."</td>
                            <td class='pt-3-half' >".$row['username']."</td>
                            <td class='pt-3-half' >".$row['email_address']."</td>
                            <td class='pt-3-half' >".$row['mobile_number']."</td>
                            <td class='pt-3-half' >".$row['password']."</td>
                        </tr>      
                ";
            }
        echo "
                </table>
            </div>
        </div>
    </div><br>
";

?>

    

<br><div class="alert alert-primary" role="alert">
         <center><b>Uploaded Songs</b></center>
    </div>

<?php 

    include('connection.php');

    $sql = "SELECT * FROM upload_albums order by song_id";
    $result = mysqli_query($conn,$sql);

    echo "
        <div class='card'>
            <h3 class='card-header text-center font-weight-bold text-uppercase py-4'>Uploaded Songs</h3>
            <div class='card-body'>
                <div id='table' class='table-editable'>
                    <table class='table table-bordered table-responsive-md table-striped text-center'>
                        <tr>
                            <th class='text-center'>Song id</th>
                            <th class='text-center'>Song Name</th>
                            <th class='text-center'>Song format</th>
                            <th class='text-center'>Singer Name</th>
                            <th class='text-center'>Audio File</th>
                        </tr>
        ";
        while($row = mysqli_fetch_array($result)){
            $song_id = $row['song_id'];
            $audio_file = $row['audio_file'];
            echo "
                <form method='post' action=admin_page.php>
                    <tr>
                        <td class='pt-3-half' >".$row['song_id']."</td>
                        <td class='pt-3-half' >".$row['song_name']."</td>
                        <td class='pt-3-half' >".$row['song_format']."</td>
                        <td class='pt-3-half' >".$row['artist_name']."</td>       
                        <td class='pt-3-half' ><audio class='embed-responsive-item' controls='' preload='none'> <source src='songs/uploaded_songs/$audio_file' type='audio/mp3'></audio></td>
                        <td>
                            <span><button type='submit' name='$song_id' class='btn btn-danger btn-rounded btn-sm my-0'>Delete Song  <i class='fa fa-trash'></i></button></span>
                        </td>
                    </tr> 
                </form>     
            ";
        }
        echo "
                </table>
            </div>
        </div>
    </div>
";
?>
	<!-- copyright -->
	<div class="cpy-right text-center">
		<p>© 2021 Cadenza. All rights reserved</p>
	</div>
    <!-- //copyright -->
    <!-- js-->
	<script src="js/jquery-2.2.3.min.js"></script>
	<!-- js-->
	<!-- MDB core JavaScript -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.14/js/mdb.min.js"></script>
	<!-- start-smooth-scrolling -->
	<script src="js/move-top.js "></script>
    <script src="js/easing.js "></script>
    <script src="js/SmoothScroll.min.js "></script>
	<!-- //smooth-scrolling-of-move-up -->
	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.js"></script>
	<!-- //Bootstrap Core JavaScript -->
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/sweetalert2@7.28.11/dist/sweetalert2.min.js"></script>
</body>

</html>