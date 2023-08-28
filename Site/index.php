<!doctype html>
<head>
  <title>Qamsoft</title>
  <link rel="icon" type="image/x-icon" href="./assets/images/icon.PNG">
 

    <?php include 'header.php';?>
<?php
session_start();
require_once("dbConnection.php");
?>
</head>
<section id="main">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
<div class="main-data">
    <h1>Learn with Qamsoft Technologies</h1>
    <p>QamSoft Technologies stands as a beacon of excellence in the realm of programming training institutes. With an unwavering commitment to fostering unparalleled expertise and nurturing aspiring programmers, QamSoft has emerged as the definitive choice for those seeking the finest programming education.</p>

    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    Register Now
</button>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      
      <div class="modal-body">
	  <div class="form-landing">

<form action="addAction.php" method="POST">
  <h3>Post Inquiry </h3>
  <div class="form-group">

	
	<input type="text" class="form-control" name="name" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Full Name" required>
	
  </div>
  <div class="form-group">
	
	<input type="email" class="form-control"  name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email " required>
	
  </div>
  <div class="form-group">
	
	<input type="tel" class="form-control" name="cellno" id="exampleInputEmaill" aria-describedby="emailHelp" placeholder="Cell No" required>
	
  </div>
  <div class="form-group">
	
	<textarea class="form-control" name="message" id="exampleFormControlTextarea1" rows="3" placeholder="Your Message" required></textarea>
  </div>
  
  <input value="Submit"  name="submit" type="submit" class="landing-form-btn">


</form>
<?php
if(isset($_SESSION['status'])){
echo $_SESSION['status'];
unset( $_SESSION['status']);
}
?>
</div>
      </div>
      
    </div>

  </div>
</div>
</div>

<div class="row stats">
    
</div>
            </div>
            <div class="col-lg-4">
           
            <div class="anc-home">
  
<marquee behavior="scroll" direction="up" scrollamount="3" onmouseover="this.stop();" onmouseout="this.start();">
  
   <ul>
   <?php $result = mysqli_query($mysqli, "SELECT * FROM events ORDER BY id DESC");?>

   </ul>
</marquee>
    </div>
  
               
          
            </div>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<?php include 'footer.php';?>



