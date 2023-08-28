<?php
$databaseHost = 'localhost';
$databaseName = 'lms';
$databaseUsername = 'root';
$databasePassword = '';

// Open a new connection to the MySQL server
$mysqli = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName); 
if($mysqli){}else{
	echo "Database Connection error";
}