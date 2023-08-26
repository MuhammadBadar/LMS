<?php
// Include the database connection file
require_once("dbConnection.php");

// Get id from URL parameter
$id = $_GET['Id'];

// Select data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM course WHERE Id = $id ");

// Fetch the next row of a result set as an associative array
$resultData = mysqli_fetch_assoc($result);

$Fee = $resultData['Fee'];
$shortdescription = $resultData['ShortDescription'];
$logopath = $resultData['LogoPath'];
$title = $resultData['Title'];

?>
<html>
<head>	
	<title>Edit Data</title>
</head>

<body>
    <h2>Edit Data</h2>
    <p>
	    <a href="ManageCourse.php">Home</a>
    </p>
	
	<form name="edit" method="post" action="editAction.php">
		<table border="0">
		
			<tr> 
				<td>Title</td>
				<td><input type="text" name="Title" value="<?php echo $title; ?>"></td>
			</tr>
			<tr> 
				<td>ShortDescription</td>
				<td><input type="text" name="ShortDescription" value="<?php echo $shortdescription; ?>"></td>
			</tr>
			<tr> 
				<td>LogoPath</td>
				<td><input type="text" name="LogoPath" value="<?php echo $logopath; ?>"></td>
			</tr>
			<tr>
				<td><input type="hidden" name="Id" value=<?php echo $id; ?>></td>
				<td><input type="submit" name="update" value="Update"></td>
			</tr>
		</table>
	</form>
</body>
</html>
