<?php
require_once("dbConnection.php");

if (isset($_POST['update'])) {
    // Escape and sanitize the input
    $id = mysqli_real_escape_string($mysqli, $_POST['id']);
    $title = mysqli_real_escape_string($mysqli, $_POST['title']);
    $description = mysqli_real_escape_string($mysqli, $_POST['description']);

    // Check for empty fields
    if (empty($title) || empty($description)) {
        echo "<font color='red'>One or more fields are empty.</font><br/>";
    } else {
        // Update the database table using a prepared statement
        $stmt = $mysqli->prepare("UPDATE announcement SET title = ?, description = ? WHERE id = ?");
        
        // Bind parameters with correct data types
        $stmt->bind_param("ssi", $title, $description, $id);
        
        $result = $stmt->execute();
        $stmt->close();

        if ($result) {
            // Display success message
            echo "<p><font color='green'>Data updated successfully!</p>";
            echo "<a href='ManageAnnouncement.php'>View Result</a>";

            header('location: ManageAnnouncement.php');
        } else {
            // Display error message
            echo "<p><font color='red'>Error updating data: " . $mysqli->error . "</font></p>";
        }
    }
}
?>
