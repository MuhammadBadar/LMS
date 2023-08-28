<?php

if(isset($_SESSION['loggedin'])){
	$username = $_SESSION['name'];
}else{
	$username = "User";
}
// $username = "Hira"; 
$html = '
<div class="col-lg-2">
<a href="index.php">Back to site</a>
	<div class="user-id">
		<h2>Hello ' . $username . '</h2>
		<a href="logout.php"><i class="fa-solid fa-right-from-bracket"></i>Sign Out</a>
	</div>
</div>
</div>
</div>
';