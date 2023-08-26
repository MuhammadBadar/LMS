



<?php
// Include the database connection file
require_once("dbConnection.php");

// Get id parameter value from URL
$id = $_GET['Id'];

// Delete row from the database table
$result = mysqli_query($mysqli, "DELETE FROM course WHERE Id = $id");

// Redirect to the main display page (index.php in our case)
header("Location:ManageCourse.php");