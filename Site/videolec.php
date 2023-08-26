<!doctype html>

    <?php include 'header.php';?>

    	
	<?php

require_once("dbConnection.php");
$id = "";
if(isset($_GET['id'])){
  $id = $_GET['id'];
}else{
  header('location: courses.php');
  exit;
}


 $result = mysqli_query($mysqli, "SELECT * FROM videolecture where id= ".$id);
  if(mysqli_num_rows($result) > 0){
    $row = mysqli_fetch_array($result);
    $detail = $row['Title'];
      $det = $row['Lec.No'];
    $detai = $row['URL'];
    // $course = $row['course'];
  }else{
    echo "No lecture video found";
    exit();
  }

?>
<!----------main landing-->

<body>
<section id="main-contact-bg">
     
     </section>
 
      <section id="contact-bar">
      <div class="container">
       <div class="row">
         <div class="col-lg-12">
           <div class="contact-bar">
             <h2>Video Lecture</h2>
           </div>
         </div>
       </div>
      </div>
      </section>
     
      <div class="container">
   
      <?php
		echo $detail."<br>";	
    echo"LectureNO: " . $det."<br>";	
    	
   

   $data = $row ['URL'];
   $final = str_replace('watch?v=', 'embed/',$data);
   echo "<iframe 

    src='$final'; 

     frameborder='0';
     allow='autoplay; encrypted-media'; 
      allowfullscreen>
      </iframe>"; 

      ?>

<!--  
        <div class="row vid-main">
            <div class="col-lg-4">
<a href="angularlecture.php">
            <div class="card">
  <img class="card-img-top" src="./assets/images/angular.png">
  <div class="card-body">
    <p class="card-text">AngularJS & WebAPI Video Lectures</p>
    <button class="vid-lec-btn">View Now</button>
  </div>
</div>
</a>
            </div>

            <div class="col-lg-4">
                <a href="ooplecture.php">
            <div class="card">
            <img class="card-img-top" src="./assets/images/oop.png">
  <div class="card-body">
    <p class="card-text">OOP (Object Oriented Programming) Video Lectures</p>
    <button class="vid-lec-btn">View Now</button>
  </div>
</div>
</a>
            </div>

            <div class="col-lg-4">
            <div class="card">
                <a href="adolecture.php">
            <img class="card-img-top" src="./assets/images/ado.png">
  <div class="card-body">
    <p class="card-text">ADO.NET Video Lectures</p>
    <button class="vid-lec-btn">View Now</button>
  </div>
</div>
</a>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-4">
            <div class="card">
                <a href="mvclecture.php">
  <img class="card-img-top" src="./assets/images/netcore.png">
  <div class="card-body">
    <p class="card-text">Win Forms Video Lectures - For Developing Desktop Applications</p>
    <button class="vid-lec-btn">View Now</button>
  </div>
</div>
</a>
            </div>

            <div class="col-lg-4">
                <a href="mvclecture.php">
            <div class="card">

            <img class="card-img-top" src="./assets/images/aspnet.png">
  <div class="card-body">
    <p class="card-text">ASP.NET MVC Professional Training - English Version</p>
    <button class="vid-lec-btn">View Now</button>
  </div>
</div>
</a>
            </div>

            <div class="col-lg-4">
            <a href="mvclecture.php">
            <div class="card">
            <img class="card-img-top" src="./assets/images/netcore.png">
  <div class="card-body">
    <p class="card-text">ASP.NET MVC Professional Training - Urdu Version</p>
    <button class="vid-lec-btn">View Now</button>
  </div>
</div>
</a>
            </div>
        </div>

      </div>
</body>  -->
<?php include 'footer.php';?>