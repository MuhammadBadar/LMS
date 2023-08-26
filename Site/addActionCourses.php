<html>
<head>
	<title>Add Data</title>
</head>

<body>
	<h2>Add Data</h2>
	<p>
		<a href="ManageCourse.php">Home</a>
	</p>

	<form action="addcourses.php" method="post" name="add">
		<table width="25%" border="0">
			<tr> 
				<td>Title</td>
				<td><input type="text" name="Title"></td>
			</tr>
			<tr> 
				<td>ShortDescripion</td>
				<td><input type="text" name="ShortDescription"></td>
			</tr>
			<tr> 
				<td>LogoPath</td>
				<td><input type="text" name="LogoPath"></td>
			</tr>
			
			<tr> 
				<td></td>
				<td><input type="submit" name="submit" value="Add"></td>
			</tr>
		</table>
	</form>
</body>
</html>
