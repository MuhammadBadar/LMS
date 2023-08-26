<?php
require_once("dbConnection.php");

if (isset($_POST['update'])) {
    // Escape and sanitize the input
    $id = mysqli_real_escape_string($mysqli, $_POST['Id']);
    $title = mysqli_real_escape_string($mysqli, $_POST['Title']);
    $shortdescription = mysqli_real_escape_string($mysqli, $_POST['ShortDescription']);
    $logopath = mysqli_real_escape_string($mysqli, $_POST['LogoPath']);	

    // Check for empty fields
    if (empty($title) || empty($shortdescription) || empty($logopath)) {
        echo "<font color='red'>One or more fields are empty.</font><br/>";
    } else {
        // Update the database table using a prepared statement
        $stmt = $mysqli->prepare("UPDATE course SET Title = ?, ShortDescription = ?, LogoPath = ? WHERE Id = ?");
        $stmt->bind_param("sssi", $title, $shortdescription, $logopath, $id);
        $result = $stmt->execute();
        $stmt->close();

        if ($result) {
            // Display success message
            echo "<p><font color='green'>Data updated successfully!</p>";
            echo "<a href='ManageCourse.php'>View Result</a>";
        } else {
            // Display error message
            echo "<p><font color='red'>Error updating data: " . $mysqli->error . "</font></p>";
        }
    }
}
?>
