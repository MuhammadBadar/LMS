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
	$eventtitle = mysqli_real_escape_string($mysqli, $_POST['eventTitle']);
	$eventplace = mysqli_real_escape_string($mysqli, $_POST['eventPlace']);
	$starttime = mysqli_real_escape_string($mysqli, $_POST['startTime']);
	$endtime = mysqli_real_escape_string($mysqli, $_POST['endTime']);
	$eventdate= mysqli_real_escape_string($mysqli, $_POST['eventDate']);
		
		
		// If all the fields are filled (not empty) 

		// Insert data into database
		$result = mysqli_query($mysqli, "INSERT INTO events (`eventTitle`,`eventPlace`,`startTime`,`endTime`,`eventDate`) VALUES ('$eventtitle','$eventplace', '$starttime','$endtime','$eventdate')");
		
		// Display success message
		echo "<p><font color='green'>Data added successfully!</p>";
		echo "<a href='index.php'>View Result</a>";
		
		
		
		
		
		
	// Check for empty fields
	if (empty($eventtitle) || empty($eventplace) || empty($starttime) || empty($endtime) || empty($eventdate)) {
		if (empty($eventtitle)) {
			echo "<font color='red'>eventTitle field is empty.</font><br/>";
		}
		
		if (empty($eventplace)) {
			echo "<font color='red'>eventPlace field is empty.</font><br/>";
		}
		
		if (empty($starttime)) {
			echo "<font color='red'>startTime No field is empty.</font><br/>";
		}
		
		if (empty($endtime)) {
			echo "<font color='red'>endTime field is empty.</font><br/>";
		}
		if (empty($eventdate)) {
			echo "<font color='red'>eventDate field is empty.</font><br/>";
		}
		// Show link to the previous page
		 echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		
	}
}
?>
</body>
</html>