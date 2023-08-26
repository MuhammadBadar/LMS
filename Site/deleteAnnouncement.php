


<?php
// Include the database connection file
require_once("dbConnection.php");

// Get id parameter value from URL
$id = $_GET['id'];

// Delete row from the database table
$result = mysqli_query($mysqli, "DELETE FROM announcement WHERE id = $id");

// Check if the deletion was successful
if ($result) {
    // Redirect to the main display page (ManageAnnouncement.php in your case)
    header("Location: ManageAnnouncement.php");
} else {
    // Display an error message
    echo "Error deleting data: " . mysqli_error($mysqli);
}
?>
