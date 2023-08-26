<?php

session_start(); 

// Include the database connection file

$databaseHost = 'localhost';
$databaseName = 'lms';
$databaseUsername = 'root';
$databasePassword = '';

// Open a new connection to the MySQL server
$con = mysqli_connect($databaseHost, $databaseUsername, $databasePassword, $databaseName); 
if($con){
    $qry = "SELECT * FROM login where username = '". $_POST['username']."' AND password = '".$_POST['password']."'";
    $runQuery = mysqli_query($con, $qry);
    if(mysqli_num_rows($runQuery) > 0){
        $row = mysqli_fetch_array($runQuery);
        // print_r($row);
            session_regenerate_id();
            $_SESSION['loggedin'] = TRUE;
            $_SESSION['name']= $_POST['username'];
            $_SESSION['id']= $row['id'];
            header('Location:backoffice.php');
    }else{
        echo "No user found";
    }
}else{
	echo "Database Connection error";
}

exit();

if($stmt=$con -> prepare ('SELECT id,password FROM login WHERE username = ?.')) {

    $stmt->bind_param('s',$_POST['username']);

     $stmt->execute ();
     $stmt->store_result();

     if($stmt -> num_rows > 0){

        $stmt->bind_result($id,$password);

        $stmt-> fetch();

        if($_POST['password'] === $password){



            session_regenerate_id();
            $_SESSION['loggedin'] = TRUE;
            $_SESSION['name']= $_POST['username'];
            $_SESSION['id']= $id;
            header('Location:backoffice.php');
        }
else{
    echo('incorrect username or password ');
    header('refresh :2;url=backoffice.php'); 
}
     }
else{
    echo('incorrect username ');
    header('refresh :2;url=login.php'); 
}
     


$stmt->close();
}
?>