// Fetch data from a table (replace with your own query)
<?php
$sql = "SELECT * FROM your_table_course";
$result = $conn->query($sql);

// Process fetched data
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        echo "ID: " . $row["id"] . " - Title: " . $row["title"] . "<br>";
    }
} else {
    echo "0 results";
}

$conn->close();
?>