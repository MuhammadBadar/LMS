<html>
<?php
// Include the database connection file
require_once("dbConnection.php");
$result = mysqli_query($mysqli, "SELECT * FROM announcement ORDER BY id DESC");
?>
 <?php
session_start();
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

	
<?php
    $title = "";
    $description = "";
    if(isset($_GET['id'])){
        $id = $_GET['id'];
    
    // Select data associated with this particular id
    $res = mysqli_query($mysqli, "SELECT * FROM announcement WHERE id = $id ");
    
    // Fetch the next row of a result set as an associative array
    $resultData = mysqli_fetch_assoc($res);
    
    
    $description = $resultData['description'];
  
    $title = $resultData['title'];

    }
    ?>



<div class="col-lg-7">
	<div class="content"> 
<div class="container">
    <div class="row">
        <div class="col-lg-12 main-manage-course">
<div class="form-manage-course">
             <h1>Manage Announcment</h1>
          <form action="<?php if(isset($_GET['id'])){ echo "editActionannouncement.php";}else{ echo "addannouncment.php";}?>" method="POST" enctype="multipart/form-data">
            <div class="row">
                <div class="col"><input type="hidden" name="id" value="<?php if(isset($_GET['id'])){ echo $_GET['id'];  } ?>">
            <div class="row">
                <div class="col">
            <div class="form-group">
                <input type="text" class="form-control" name="title" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Title"  required value = " <?php if(isset($_GET['id'])){ echo $title; } ?>">
            </div>
            </div>
            <div class="col">
            <div class="form-group">
                <input type="text" class="form-control" name="description" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Description" required value="<?php if(isset($_GET['id'])){ echo $description;  } ?>">
            </div>
            </div>
            </div>
            </div>
            <div class="col">
             </div>
            </div>
            <input value="<?php if(isset($_GET['id'])){ echo "Update"; }else{ echo "Submit"; }?>" name="<?php if(isset($_GET['id'])){ echo "update"; }else{ echo "submit"; }?>" type="submit" class="landing-form-btn">
        </form>
    </div>
    </div>
    </div>
    <!-- Include necessary scripts or other HTML content here -->
    <table width=100%' border=0>
		<tr bgcolor='#DDDDDD'>
			<td><strong>Title</strong></td>
			<td><strong>Descripion</strong></td>
            <td><strong>Actions</strong></td>
        </tr>
		 <?php
		// Fetch the next row of a result set as an associative array
		while ($res = mysqli_fetch_assoc($result)) {
			 echo "<tr>";
			echo "<td>".$res['title']."</td>";
			echo "<td>".$res['description']."</td>";		
            echo "<td><a href=\"ManageAnnouncement.php?id=$res[id]\">Edit</a> | 
			<a href=\"deleteAnnouncement.php?id=$res[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
		}
		?> 
	</table>
    </div>
    
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