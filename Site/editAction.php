<?php
require_once("dbConnection.php");

if (isset($_POST['update'])) {
    // echo $_POST['update'];
    if($_POST['Id'] != "" || $_POST['Id'] != null){
    // Escape and sanitize the input
    $id = mysqli_real_escape_string($mysqli, $_POST['Id']);
    $title = mysqli_real_escape_string($mysqli, $_POST['Title']);
    $shortdescription = mysqli_real_escape_string($mysqli, $_POST['ShortDescription']);
    $logopath = $_FILES['LogoPath']['name'];	

    // Check for empty fields
    if (empty($title) || empty($shortdescription)) {
        echo "<font color='red'>Title and description cannot be empty.</font><br/>";
    } else {
        $path = "";
        if(isset($logopath)){
            $dir = "uploads/";
            $file = $dir.basename($_FILES['LogoPath']['name']);
            if(move_uploaded_file($_FILES['LogoPath']['tmp_name'], $file)){
                $path = $file;
            }
        }
        // Update the database table using a prepared statement
        if($path == "" || $path == null){
            $stmt = $mysqli->prepare("UPDATE course SET Title = ?, ShortDescription = ? WHERE Id = ?");
            $stmt->bind_param("sssi", $title, $shortdescription, $id);
        }else{
            $stmt = $mysqli->prepare("UPDATE course SET Title = ?, ShortDescription = ?, LogoPath = ? WHERE Id = ?");
            $stmt->bind_param("sssi", $title, $shortdescription, $path, $id);
        }
        
        $result = $stmt->execute();
        $stmt->close();

        if ($result) {
            
            // Display success message
            echo "<p><font color='green'>Data updated successfully!</p>";
            echo "<a href='ManageCourse.php'>View Result</a>";

            header('location: ManageCourse.php');
        } else {
            // Display error message
            echo "<p><font color='red'>Error updating data: " . $mysqli->error . "</font></p>";
        }
    }
}else{
    echo "Wrong information";
}
}
?>
