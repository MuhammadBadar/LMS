<?php
// Include the database connection file
require_once("dbConnection.php");

// Get id from URL parameter

$id = $_GET['id'];

// Select data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM  events WHERE  id = $id ");

// Fetch the next row of a result set as an associative array
$resultData = mysqli_fetch_assoc($result);

$eventtitle = $resultData['eventTitle'];
$eventplace = $resultData['eventPlace'];
$starttime = $resultData['startTime'];
$endtime = $resultData['endTime'];
$eventDate = $resultData['eventDate'];

?>
<html>
<head>	
	<title>Edit Data</title>
</head>

<body>
    <h2>Edit Data</h2>
    <p>
	    <a href="Manageupcomingevents.php">Home</a>
    </p>
	
	<form name="edit" method="post" action="editactionevents.php">
		<table border="0">
		
			<tr> 
				<td>Event Title</td>
				<td><input type="text" name="eventTitle" value="<?php echo $eventtitle; ?>"></td>
			</tr>
			<tr> 
				<td>Event Place</td>
				<td><input type="text" name="eventPlace" value="<?php echo $eventtitle; ?>"></td>
			</tr>
			<tr> 
				<td>Start Time</td>
				<td><input type="text" name="startTime" value="<?php echo $starttime; ?>"></td>
			</tr>
            <tr> 
				<td>End Time</td>
				<td><input type="text" name="endTime" value="<?php echo $endtime; ?>"></td>
			</tr>
            <tr> 
				<td>Event Date</td>
				<td><input type="text" name="eventDate=" value="<?php echo $eventDate; ?>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value=<?php echo $id; ?>></td>
				<td><input type="submit" name="update" value="Update"></td>
			</tr>
		</table>
	</form>
</body>
</html>
