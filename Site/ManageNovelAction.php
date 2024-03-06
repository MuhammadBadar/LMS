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
	$name = mysqli_real_escape_string($mysqli, $_POST['Name']);
	$createdby = mysqli_real_escape_string($mysqli, $_POST['Createdby']);
	$createdon = mysqli_real_escape_string($mysqli, $_POST['Createdon']);
	$modifiedby = mysqli_real_escape_string($mysqli, $_POST['Modifiedby']);
	$modifiedon = mysqli_real_escape_string($mysqli, $_POST['Modifiedon']);
	// Check for empty fields
	if (empty($name)) {
		if (empty($name)) {
			echo "<font color='red'>Noval name field is empty.</font><br/>";
		}
	} else { 
		
			$result = mysqli_query($mysqli, "INSERT INTO novel (`Name`, `Createdby`, `Createdon`, `Modifiedby`, `Modifiedon`) VALUES ('$name', '$createdby', '$createdon', '$modifiedby', '$modifiedon')");
				header('location: ManageNovel.php');		// Display success message
		
	}
}
else if (isset($_POST['update'])) {
	echo "Inside Edit";
	$id = mysqli_real_escape_string($mysqli, $_POST['Id']);

	$name = mysqli_real_escape_string($mysqli, $_POST['Name']);
	// Check for empty fields
	if (empty($name)) {
		if (empty($name)) {
			echo "<font color='red'>Word field is empty.</font><br/>";
		}
	} else { 
		
		$result = mysqli_query($mysqli, "update novel set Name = '$name' where Id = '$id';");
		header('location: ManageNovel.php');		// Display success message
		
	}
}
?>
</body>
</html>
