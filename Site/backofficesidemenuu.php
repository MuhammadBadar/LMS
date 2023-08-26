<html>

<?php
// Include the database connection file
 require_once("dbConnection.php");

?>


<?php


session_start();

if(!isset($_SESSION['loggedin'])){
	echo('you need to login first!');
    header('refresh :2;url=login.php'); 
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
          <a class="nav-link" href="ManageCourse.php">Manage Course </a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="ManageUpcomingevents.php">Manage Upcoming Events </a>
        </li>
			
       
			
			
		</ul>
    </div>
	
	


	
	</div>
</div>

<div class="col-lg-7">
	<div class="content">
		
<!----------main landing-->


<?php
// Include the database connection file
require_once("dbConnection.php");


$result = mysqli_query($mysqli, "SELECT * FROM course ORDER BY id DESC");

 //Select data associated with this particular id
//  $result = mysqli_query($mysqli, "SELECT * FROM course");

?>
<div class="container">
    <div class="row">
        <div class="col-lg-12 main-manage-course">
<div class="form-manage-course">
             <h1>Manage Course</h1>
        <form action="addcourses.php" method="POST">
            <div class="row">
                <div class="col">
            <div class="form-group">
                <input type="text" class="form-control" name="Title" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Course Title" required>
            </div>
            </div>
            <div class="col">
            <div class="form-group">
                <input type="text" class="form-control" name="ShortDescription" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Short Description" required>
            </div>
            </div>
            </div>
            <!-- <div class="form-group">
                <input type="text" class="form-control" name="Fee" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Fee" required>
            </div> -->
            <div class="row">
                <div class="col">
                <div class="custom-file">
  <input type="file" class="custom-file-input" name="LogoPath" id="customFile">
  <label class="custom-file-label" for="customFile">Choose Logo</label>
</div>
            </div>
            <div class="col">
            
            </div>
            </div>
            <input value="send" name="submit" type="submit" class="landing-form-btn">
        </form>
    </div>
    </div>
    </div>

    <!-- Include necessary scripts or other HTML content here -->




    <table width=100%' border=0>
		<tr bgcolor='#DDDDDD'>
			<td><strong>Course</strong></td>
			<td><strong>ShortDescripion</strong></td>
			<!-- <td><strong>Fee</strong></td> -->
			<td><strong>LogoPath</strong></td>
            <td><strong>Actions</strong></td>

		</tr>
		 <?php
		// Fetch the next row of a result set as an associative array
		while ($res = mysqli_fetch_assoc($result)) {
			 echo "<tr>";
			// echo "<td>".$res['Fee']."</td>";
			echo "<td>".$res['Title']."</td>";
			echo "<td>".$res['ShortDescription']."</td>";	
            echo "<td>".$res['LogoPath']."</td>";	
            echo "<td><a href=\"edit.php?Id=$res[Id]\">Edit</a> | 
			<a href=\"delete.php?Id=$res[Id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
		}
		?> 
	</table>
    </div>
</body>
</html>
	</div>


<?php
// Assuming you have fetched the username from the database and stored it in $username variable
$username = "Hira"; // Replace this with your database retrieval code

// The rest of your HTML code
$html = '
<div class="col-lg-2">
	<div class="user-id">
		<h2>Hello ' . $username . '</h2>
		<a href=""><i class="fa-solid fa-right-from-bracket"></i>Sign Out</a>
	</div>
</div>
</div>
</div>
';
// Output the HTML
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