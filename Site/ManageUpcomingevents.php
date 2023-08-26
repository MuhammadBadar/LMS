<html>

<?php
// Include the database connection file
require_once("dbConnection.php");
$result = mysqli_query($mysqli, "SELECT * FROM events ORDER BY id DESC");
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
          <a class="nav-link" href="ManageInquiry.php">Manage Inquiry </a>
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
<div class="container">
    <div class="row">
        <div class="col-lg-12 main-manage-course">
<div class="form-manage-course">
             <h1>Manage  Upcoming Events</h1>
        <form action="upcomingAction.php" method="POST">
            <div class="row">
                <div class="col">
            <div class="form-group">
                <input type="text" class="form-control" name="eventTitle" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Event Title" required>
            </div>
            </div>
            <div class="col">
            <div class="form-group">
                <input type="text" class="form-control" name="eventPlace" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Event Place" required>
            </div>
            </div>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="startTime" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Start Time" required>
            </div> 
            <div class="form-group">
                <input type="text" class="form-control" name="endTime" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="End Time" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="eventDate" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Event Date" required>
            </div>
            </div>

            <div class="col">
            
            </div>
            </div>
            <input value="send" name="submit" type="submit" class="landing-form-btn">
            <?php
            if(isset($_SESSION['status'])){
              echo $_SESSION['status'];
              unset( $_SESSION['status']);
            }
             ?>
        </form>
    </div>
    </div>
    

    <!-- Include necessary scripts or other HTML content here -->




    <table width=100%' border=0>
		<tr bgcolor='#DDDDDD'>
			<td><strong>Event Title</strong></td>
			<td><strong>Event Place</strong></td>
			 <td><strong>Start Time</strong></td> 
			<td><strong>End Time</strong></td>
            <td><strong>Event Date</strong></td>
            <td><strong>Actions</strong></td>

		</tr>
		 <?php
		// Fetch the next row of a result set as an associative array
		while ($res = mysqli_fetch_assoc($result)) {
			 echo "<tr>";
			// echo "<td>".$res['Fee']."</td>";
			echo "<td>".$res['eventTitle']."</td>";
			echo "<td>".$res['eventPlace']."</td>";	
            echo "<td>".$res['startTime']."</td>";	
            echo "<td>".$res['endTime']."</td>";	
            echo "<td>".$res['eventDate']."</td>";	
            echo "<td><a href=\"eventedit.php?id=$res[id]\">Edit</a> | 
			<a href=\"deleteevent.php?id=$res[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
		}
		?> 
	</table>
    </div>
    </div>


</body>
</html>