<?php
require_once("dbConnection.php");

if (isset($_POST['update'])) {
    // Escape and sanitize the input
    $id = mysqli_real_escape_string($mysqli, $_POST['id']);
    $eventtitle = mysqli_real_escape_string($mysqli, $_POST['eventTitle']);
    $eventplace = mysqli_real_escape_string($mysqli, $_POST['eventPlace']);
    $starttime = mysqli_real_escape_string($mysqli, $_POST['startTime']);
    $endtime = mysqli_real_escape_string($mysqli, $_POST['endTime']);
    $eventdate = mysqli_real_escape_string($mysqli, $_POST['eventDate']);
    echo ($_POST['eventDate']);
    // Check for empty fields
    if (empty($eventtitle) || empty($eventplace) || empty($starttime)|| empty($endTime) || empty($eventdate)) {
        echo "<font color='red'>One or more fields are empty.</font><br/>";
    } else {
        // Update the database table using a prepared statement
        $stmt = $mysqli->prepare("UPDATE events SET eventTitle = ?, eventPlace = ?, startTime = ?, endTime = ?, eventDate = ? WHERE id = ?");
        $stmt->bind_param("sssi", $eventtitle, $eventplace, $starttime,$endtime,$eventdate, $id);
        $result = $stmt->execute();
        $stmt->close();

        if ($result) {
            // Display success message
            // echo "<p><font color='green'>Data updated successfully!</p>";
            // echo "<a href='ManageUpcomingevents.php'>View Result</a>";
            $_SESSION['status'] = "Inquiry Posted Successfully. Soon you will get response";
			// Redirect to index.php after successful data insertion
			header("Location: ManageUpcomingevents.php");
        } else {
            // Display error message
            echo "<p><font color='red'>Error updating data: " . $mysqli->error . "</font></p>";
        }
    }
}
?>
