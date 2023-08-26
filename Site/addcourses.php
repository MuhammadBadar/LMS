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
	$logopath = mysqli_real_escape_string($mysqli, $_POST['LogoPath']);
	
		
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

		// Insert data into database
		$result = mysqli_query($mysqli, "INSERT INTO course (`Title`, `ShortDescription`, `LogoPath`) VALUES ('$title', '$shortdescription', '$logopath')");
		
		// Display success message
		// echo "<p><font color='green'>Data added successfully!</p>";
		// echo "<href='ManageCourse.php'>";
	}
}
?>
</body>
</html>
