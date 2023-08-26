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
	$name = mysqli_real_escape_string($mysqli, $_POST['name']);
	$email = mysqli_real_escape_string($mysqli, $_POST['email']);
	$cellno = mysqli_real_escape_string($mysqli, $_POST['cellno']);
	$message = mysqli_real_escape_string($mysqli, $_POST['message']);
		
	// Check for empty fields
	if (empty($name) || empty($email) || empty($cellno) || empty($message)) {
		if (empty($name)) {
			echo "<font color='red'>Name field is empty.</font><br/>";
		}
		
		if (empty($email)) {
			echo "<font color='red'>Email field is empty.</font><br/>";
		}
		
		if (empty($cellno)) {
			echo "<font color='red'>Cell No field is empty.</font><br/>";
		}
		
		if (empty($message)) {
			echo "<font color='red'>Message field is empty.</font><br/>";
		}
		// Show link to the previous page
		echo "<br/><a href='index.php'>Go back</a>";
	} else {
		// Insert data into database
		$result = mysqli_query($mysqli, "INSERT INTO users (`name`,`email`,`cellno`,`message`) VALUES ('$name','$email', '$cellno','$message')");
		
		if ($result) {
		$_SESSION['status'] = "Inquiry Posted Successfully. Soon you will get response";
			// Redirect to index.php after successful data insertion
			header("Location: contact.php");
		
		} else {
			echo "<p><font color='red'>Error adding data: " . mysqli_error($mysqli) . "</font></p>";
		}
	}
}
?>
</body>
</html>
