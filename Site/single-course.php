<!doctype html>
 <?php include 'header.php';?>

    
	
	<?php

require_once("dbConnection.php");
$id = "";
if(isset($_GET['id'])){
  $id = $_GET['id'];
}else{
  header('location: index.php');
  exit;
}


 $result = mysqli_query($mysqli, "SELECT * FROM coursedetails where id= ".$id);
  if(mysqli_num_rows($result) > 0){
    $row = mysqli_fetch_array($result);
    $detail = $row['courseDetails'];
    // $course = $row['course'];
  }else{
    echo "No course details found";
    exit();
  }

?>
  <div class="container">
	<h2>About</h2>	  


 
 <section id="course-detail">


  
    <div class="row">
      <div class="col-lg-12">
        <div class="cours-d-vid">
 
<?php 
    
		echo $detail."<br>";	
             	
?>
		    <div class="row">
          <div class="trainer-head">
            <h2>Meet The Trainer(s)</h2>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-2">
            <div class="img-trainer"></div>
          </div>
          <div class="col-lg-10">
            <div class="about-trainer">
    
             <h3>Muhammad Badar ur Zaman</h3>
             <hr>
             <p>Trainer, Architect, Consultant, Expert in design, development, and implementation using current best advanced technologies. Currently working as a QA Manager , having over 15+ years of extensive hands on experience of designing, developing & implementing n-tier applications. Self-motivated, workaholic, combined with a collaborative spirit to guarantee breakthrough results in any complex technology environment. Emphasis on knowledge sharing, commitment to understand current technological trends. Competitive drive that increases team performance, productivity, and efficiency.</p>
            </div>
          </div>
        </div>
      </div>
      <?php include 'footer.php';?>
      <!-- <div class="col-lg-4">
        <div class="course-details">
          <div class="course-info">
            <p><i class="fa-solid fa-clock"></i>Batch Duration: 12 Weeks</p>
            <hr>
            <p><i class="fa-solid fa-clock"></i>Batch Duration: 12 Weeks</p>
            <hr>
            <p><i class="fa-solid fa-clock"></i>Batch Duration: 12 Weeks</p>
            <hr>
            <p><i class="fa-solid fa-clock"></i>Batch Duration: 12 Weeks</p>
            <hr>
            <p><i class="fa-solid fa-clock"></i>Batch Duration: 12 Weeks</p>
            <hr>
            <p><i class="fa-solid fa-clock"></i>Batch Duration: 12 Weeks</p>
            <hr>
            <p><i class="fa-solid fa-clock"></i>Batch Duration: 12 Weeks</p>
          </div>
          
        </div>
        <div class="course-d-btn">
          <button class="course-d-button">Enroll Now</button>
        </div>
        <div class="learn-course">
          <h3>What you will learn</h3>
          <h4>After completing this course, trainees will be able to:-</h4>
          <li>Present ideas\illustrations using the basic concepts of Design.</li>
          <li>Present ideas\illustrations using the basic concepts of Design.</li>
          <li>Present ideas\illustrations using the basic concepts of Design.</li>
          <li>Present ideas\illustrations using the basic concepts of Design.</li>
          <li>Present ideas\illustrations using the basic concepts of Design.</li>
          <li>Present ideas\illustrations using the basic concepts of Design.</li>
          <li>Present ideas\illustrations using the basic concepts of Design.</li>

        </div>
      </div>
    </div>
    
  </div>














    
<!--   
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html> -->