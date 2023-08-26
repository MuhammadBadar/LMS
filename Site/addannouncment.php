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
	$title = mysqli_real_escape_string($mysqli, $_POST['title']);
	$description = mysqli_real_escape_string($mysqli, $_POST['description']);
	// $logopath = mysqli_real_escape_string($mysqli, $_POST['LogoPath']);
		
	// Check for empty fields
	if (empty($title) || empty($description) ) {
		if (empty($title)) {
			echo "<font color='red'>Title field is empty.</font><br/>";
		}
		
		if (empty($description)) {
			echo "<font color='red'>Description field is empty.</font><br/>";
		}
	} else {  
		// Insert data into database
		$result = mysqli_query($mysqli, "INSERT INTO announcement (`title`, `description`) VALUES ('$title', '$description')");
	}
}
?>
</body>
</html>
