<html>
<head>
	<title>Add Data</title>
</head>

<body>
	<?php
	$username= "Hira";
	$password="1234";  
	
session_start(); 

if(isset($_SESSION['username'])){
echo "<h1>Welcome". $_SESSION['username']."</h1>";
echo " <a href = '.php'></a> <br>";

echo "<br> <a href = 'logout.php'><input type=button  value=logout name=logout></a>";
}
else{
	if($_POST['username']==$username && $_POST['password']==$password){
		$_SESSION ['username']=$username;
		echo "<script>location.href='login.php'</script>";
	}
	else{
		echo "<script>alert('username or password incorrect!')</script>";

	}echo "<script>location.href='backoffice.php'</script>";
	}
?>
<?php
// Include the database connection file
require_once("dbConnection.php");

if (isset($_POST['submit'])) {
	// Escape special characters in string for use in SQL statement	
	$username = mysqli_real_escape_string($mysqli, $_POST['username']);
	$password = mysqli_real_escape_string($mysqli, $_POST['password']);
	
		$_SESSION['status'] = "no user found";
		header("Location: login.php");


		


		 
	// Check for empty fields
	if (empty($username) || empty($password) ) {
		if (empty($username)) {
			echo "<font color='red'>Username field is empty.</font><br/>";
		}
		
		if (empty($password)) {
			echo "<font color='red'>Password field is empty.</font><br/>";
		}
		
		
	
		//  echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		
	}
}
?>
</body>
</html>