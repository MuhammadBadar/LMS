<html>
<head>
	<title>Add Data</title>
</head>
<body>
<?php
session_start();
// Include the database connection file
require_once("dbConnection.php");
if (isset($_POST['submit'])) {
	// Escape special characters in string for use in SQL statement	
	$eventtitle = mysqli_real_escape_string($mysqli, $_POST['eventTitle']);
	$eventplace= mysqli_real_escape_string($mysqli, $_POST['eventPlace']);
	$starttime = mysqli_real_escape_string($mysqli, $_POST['startTime']);
	$endtime = mysqli_real_escape_string($mysqli, $_POST['endTime']);
    $eventdate = mysqli_real_escape_string($mysqli, $_POST['eventDate']);
		
	// Check for empty fields
	if (empty($eventtitle) || empty($eventplace) || empty($starttime) || empty($endtime) || empty($eventdate)) {
		if (empty($eventtitle)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if (empty($eventdate)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}
		
		if (empty($starttime)) {
			echo "<font color='red'>Cell No field is empty.</font><br/>";
		}
		
		if (empty($endtime)) {
			echo "<font color='red'>Message field is empty.</font><br/>";
		}
		if (empty($eventdate)) {
			echo "<font color='red'>Message field is empty.</font><br/>";
		}
		// Show link to the previous page
		echo "<br/><a href='index.php'>Go back</a>";
	} else {
		// Insert data into database
		$result = mysqli_query($mysqli, "INSERT INTO events (`eventTitle`,`eventPlace`,`startTime`,`endTime`,`eventDate`) VALUES ('$eventtitle','$eventplace', '$starttime','$endtime','$eventdate')");
		
		if ($result) {
		// $_SESSION['status'] = "Inquiry Posted Successfully. Soon you will get response";
			// Redirect to index.php after successful data insertion
			header("Location: ManageUpcomingevents.php");
		
		} else {
			echo "<p><font color='red'>Error adding data: " . mysqli_error($mysqli) . "</font></p>";
		}
	}
}
?>
</body>
</html>
