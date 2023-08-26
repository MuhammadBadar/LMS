<?php
// Include the database connection file
require_once("dbConnection.php");
// Get id from URL parameter
$id = $_GET['id'];
echo ($id);
// Select data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM  announcement WHERE  id = $id");
// Fetch the next row of a result set as an associative array
$resultData = mysqli_fetch_assoc($result);
$title = $resultData['title'];
$description = $resultData['description'];
?>
<html>
<head>	
	<title>Edit Data</title>
</head>
<body>
    <h2>Edit Data</h2>
    <p>
	    <a href="ManageAnnouncement.php">Home</a>
    </p>
	<form name="edit" method="post" action="editActionannouncement.php">
		<table border="0">
			<tr> 
				<td>Title</td>
				<td><input type="text" name="title" value="<?php echo $title; ?>"></td>
			</tr>
			<tr> 
				<td>Description</td>
				<td><input type="text" name="description" value="<?php echo $description; ?>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="id" value=<?php echo $id; ?>></td>
				<td><input type="submit" name="update" value="Update"></td>
			</tr>
		</table>
	</form>
</body>
</html>
