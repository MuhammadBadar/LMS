   <html>
   <?php
  require_once("dbConnection.php");

   ?>


<?php
session_start();
if(!isset($_SESSION['loggedin'])){
	echo('you need to login first!');
    header('refresh :2;url=index.php'); 
	exit();
}
?>
<head>
	<title>SideBar Menu</title>
	<link rel="stylesheet" type="text/css" href="./assets/css/back.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3">
	<div id="sidebar">
        <div class="logo">
            <img src="./assets/images/main-logo.png" alt="">
        </div>
        <div class="menu-link">
    
		<ul>
		<li class="nav-item">
          <a class="nav-link" href="Manageinquiry.php">Manage Inquiry </a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="ManageCourse.php">Manage Course </a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="ManageUpcomingevents.php">Manage Upcoming Events </a>
        </li>
	
		<li class="nav-item">
          <a class="nav-link" href="ManageAnnouncement.php">Manage Announcement </a>
        </li>
			
			
		</ul>
    </div>
	
	


	
	</div>
</div>

<div class="col-lg-7">
	<div class="content">
		<h4>Welcome Back</h4>
	</div>
</div>
<?php
// Assuming you have fetched the username from the database and stored it in $username variable
include "logoutCode.php";
echo $html;
?>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script>

	$(document).ready(function(){
		$('#sidebar-btn').click(function(){
			$('#sidebar').toggleClass('visible');
		});
	});

	</script>

</body>
</html>