<html>

<?php

// Include the database connection file
require_once("dbConnection.php");


$result = mysqli_query($mysqli, "select v.* , dl.DiffLevel  from vocabulary v Inner Join difficultylevel dl ON v.DifficultyLevelId = dl.Id");

 //Select data associated with this particular id
//  $result = mysqli_query($mysqli, "SELECT * FROM course");
// Include the database connection file
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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" c="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
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
          <a class="nav-link" href="ManageVocabulary.php">Manage Vocabulary </a>
        </li>
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
		<li class="nav-item">
          <a class="nav-link" href="ManageNovel.php">Manage Novel </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ManageNovel.php">Manage Novel Chapter</a>
        </li>
		</ul>	
			
		</ul>
    </div>
	
	<?php
    $title = "";
    $mode = "Add";
    $shortdescription = "";
    if(isset($_GET['Word'])){
        $word = $_GET['Word'];
        
        $mode = "Edit";
        // Select data associated with this particular id
        $res = mysqli_query($mysqli, "select v.* , dl.DiffLevel DifficultyLevel from vocabulary v Inner Join difficultylevel dl ON v.DifficultyLevelId = dl.Id  WHERE Word = '$word' ");
        
        // Fetch the next row of a result set as an associative array
        $resultData = mysqli_fetch_assoc($res);
        
        $Word = $resultData['Word'];
        $englishMeaning = $resultData['EnglishMeaning'];
        $urduMeaning = $resultData['UrduMeaning']; 
        $Sentence = $resultData['Sentence'];
        $pronounciation = $resultData['Pronounciation'];
    }
    ?>


	 
	</div>
</div>

<div class="col-lg-7">
	<div class="content">
    
<div class="container">
    <div class="row">
        <div class="col-lg-12 main-manage-course">
<div class="form-manage-course">
             <h1>Manage Vocabulary</h1>
             <h4>Mode: <?php echo $mode ?> </h4>
        <form action="<?php if(isset($_GET['Id'])){ echo "editAction.php";}else{ echo "ManageVocabularyAction.php";}?>" method="POST" enctype="multipart/form-data">
            <div class="row">
            <div class="col"><input type="hidden" name="Id" value="<?php if(isset($_GET['Id'])){ echo $_GET['Id'];  } ?>">
            <div class="form-group">
                
                <input type="text" class="form-control" name="Word" id="Word" aria-describedby="emailHelp" placeholder="Word" required value="<?php if(isset($_GET['Word'])){ echo $word; } ?>">
            </div>
            </div>
            <div class="col">
            <div class="form-group">
                <input type="text" class="form-control" name="EnglishMeaning" id="EnglishMeaning" aria-describedby="emailHelp" placeholder="English Meaning" required value="<?php if(isset($_GET['Word'])){ echo $englishMeaning;} ?>">
            <div class="form-group">
                <input type="text" class="form-control" name="UrduMeaning" id="UrduMeaning" aria-describedby="emailHelp" placeholder="Urdu Meaning" required value="<?php if(isset($_GET['Word'])){ echo $urduMeaning;} ?>">
                <div>
                <input type="text" class="form-control" name="Sentence" id="Sentence" aria-describedby="emailHelp" placeholder="Sentence" required value="<?php if(isset($_GET['Word'])){ echo $Sentence;} ?>">
                <div>
                <input type="text" class="form-control" name="pronounciation" id="pronounciation" aria-describedby="emailHelp" placeholder="pronounciation" required value="<?php if(isset($_GET['Word'])){ echo $pronounciation;} ?>">
</div>
            </div>
            </div>
            </div>
            <div class="form-group">
                <!-- <input type="text" class="form-control" name="Fee" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Fee" required> -->
                <select id="DifficultyLevelId" name="DifficultyLevelId" class="form-select" aria-label="Default select example">
  <option value="1" selected>High</option>
  <option value="2">Medium</option>
  <option value="3">Low</option>
  <option value="4">None</option>
</select>
            </div>
       
            </div>
            <div class="col">
            
            </div>
            </div>
            <input value="<?php if(isset($_GET['Word'])){ echo "Update"; }else{ echo "Submit"; }?>" name="<?php if(isset($_GET['Word'])){ echo "update"; }else{ echo "submit"; }?>" type="submit" class="landing-form-btn">
        </form>
    </div>
    
    </div>
    </div>

    <!-- Include necessary scripts or other HTML content here -->




    <table width=100%' border=0>
		<tr bgcolor='#DDDDDD'>
			<td><strong>Word</strong></td>
			<td><strong>English Meaning</strong></td>
            <td><strong>Urdu Meaning</strong></td>
            <td><strong>Sentence</strong></td>
            <td><strong>Pronounciation</strong></td>
            <td><strong>DifficultyLevel</strong></td>
            <td><strong>Action</strong></td>

		</tr>
		 <?php
		// Fetch the next row of a result set as an associative array
		while ($res = mysqli_fetch_assoc($result)) {
			 echo "<tr>";
			// echo "<td>".$res['Fee']."</td>";
			echo "<td>".$res['Word']."</td>";
			echo "<td>".$res['EnglishMeaning']."</td>";	
            echo "<td>".$res['UrduMeaning']."</td>";
            echo "<td>".$res['Sentence']."</td>";
            echo "<td>".$res['Pronounciation']."</td>";	
            echo "<td>".$res['DiffLevel']."</td>";
            echo "<td><a href=\"ManageVocabulary.php?Word=$res[Word]\">Edit</a> | 
			<a href=\"ManageVocabulary.php?Word=$res[Word]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
            echo "</tr>";
       }
		?> 
	</table>
    </div>
	</div>
</div>


<?php


// The rest of your HTML code
include "logoutCode.php";

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