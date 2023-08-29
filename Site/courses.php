<!doctype html>
<head>
  <title>QamSoft - Courses</title>
</head>
    <?php include 'header.php';?>
<!----------main landing-->
<?php
// Include the database connection file
require_once("dbConnection.php");

// Select data associated with this particular id
$result = mysqli_query($mysqli, "SELECT * FROM course");

// $result = mysqli_query($mysqli, "SELECT * FROM events");

?>
  
   <!-- <div class="container">
  <div class="row">
    <div class="col-lg-12">

      <div class="courses-data">
        <h3>Unlimited Live Training</h3>
        <p>Get intensive hands-on live training on .NET, JavaScript, Mobile Apps, Cloud, DevOps, Docker, Front-end technologies and many more cutting edge technologies.</p>
      </div>
    </div>
  </div> -->
 

     <section id="contact-bar">
     <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="contact-bar">
            <h2>Courses</h2>
          </div>
        </div>
      </div>
     </div>
     </section>
  <div class="container">
  <div class="row courses-row-1">

 <?php while($resultData = mysqli_fetch_array($result)){ ?>
		
    <div class="col-lg-4">
		
      <div class="angular">
	  
        <!---course------>
		
        <div class="card">
		   
		    <?php $logo = $resultData['LogoPath'] ?>
		    <?php  echo "<img src='".$resultData['LogoPath']."'>" ?>


          <div class="card-body">
            <?php 
            
                echo "Title: " .$resultData['Title']."<br>";
                // echo $resultData['Fee']."<br>";
                echo "Description: " . $resultData['ShortDescription']."<br>";	
            ?>

          <div class="text-center">
            <a href="single-course.php?id=<?php echo $resultData['Id']; ?>" class="btn btn-primary btn-block">Course Details</a>
            <!-- <a href="videolec.php?id=<?php echo $resultData['Id']; ?>" class="btn btn-primary btn-block">view Lectures</a> -->
         
          </div>
        
          </div>
		  
		  
        </div>
        <!---course------>
      </div>
    </div>
    
<?php }	?>
	
	
 </div>
  </div>
 <?php include 'footer.php';?>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>