<html>
<head>
	<title>Add Data</title>
</head>

<body>
<?php
// Include the database connection file
require_once("dbConnection.php");

if (isset($_POST['submit'])) {
	// Escape special characters in string for use in SQL statement	
	$title = mysqli_real_escape_string($mysqli, $_POST['Title']);
	$shortdescription = mysqli_real_escape_string($mysqli, $_POST['ShortDescription']);
	$logopath = $_FILES['LogoPath']['name'];
	
		
	// Check for empty fields
	if (empty($title) || empty($shortdescription) || empty($logopath)) {
		if (empty($title)) {
			echo "<font color='red'>Title field is empty.</font><br/>";
		}
		
		if (empty($shortdescription)) {
			echo "<font color='red'>ShortDescription field is empty.</font><br/>";
		}
		
		if (empty($logopath)) {
			echo "<font color='red'>LogoPath field is empty.</font><br/>";
		}
		
		// Show link to the previous page
		// echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		// If all the fields are filled (not empty) 
		$dir = "uploads/";
		$file = $dir.basename($_FILES['LogoPath']['name']);
		if(move_uploaded_file($_FILES['LogoPath']['tmp_name'], $file)){
			$path = $file;
			$result = mysqli_query($mysqli, "INSERT INTO course (`Title`, `ShortDescription`, `LogoPath`) VALUES ('$title', '$shortdescription', '$path')");
			header('location: ManageCourse.php');
		}

		// Insert data into database
		// Display success message
		// echo "<p><font color='green'>Data added successfully!</p>";
		// echo "<href='ManageCourse.php'>";
	}
}
?>
</body>
</html>
