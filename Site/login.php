
<!doctype html>

     <?php include 'header.php';?> 
<!----------main landing-->
<?php
// Include the database connection file
require_once("dbConnection.php");

?>
<?php
// start a session 
session_start();
 
// manipulate session variables 
?>
<?php
// start a session 
 //session_start();
 
// // initialize session variables 
// $_SESSION['logged_in_user_id'] = '1';
// $_SESSION['logged_in_user_name'] = 'Tutsplus';
 
// // access session variables 
// echo $_SESSION['logged_in_user_id'];
// echo $_SESSION['logged_in_user_name'];
// ?>



    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="login-left">
                  
                  <h3 class="pt-5">Nice to see you again</h3>
                  <h1>Welcome Back</h1>
                  <div class="bar-login"></div>
                  <p>The QamSoft community is a testament to our success. Our alumni are not merely graduates; they are confident, capable professionals who thrive in a competitive industry. Their achievements are a testament to the effectiveness of our training methodologies and our emphasis on cultivating problem-solving skills.
</p>
                </div>
            </div>
            <div class="col-lg-6">
             <div class="login-right">
             <h2>Login Account</h2>
             <!-- <p>.</p> -->
             <!---------------------form-------------------------------->
             <!-- <form> -->
             <form action="functions.php" method="POST">
              <div class="form-group email-label">
                <input type="name" class="form-control" name="username" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="EMAIL" required>
              </div>
              <div class="form-group pass-label">
            <input type="password" class="form-control" name="password" id="exampleInputPassword1" placeholder="PASSWORD" required>
              </div>
              <div class="form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                <label class="form-check-label" for="exampleCheck1">Keep Me Signed In</label>
              </div>
              <input value="SignIn" name="submit" type="submit" class="landing-form-btn"> 
              <?php
            if(isset($_SESSION['status'])){
              echo $_SESSION['status'];
              unset( $_SESSION['status']);
            }
             ?>
            </form>



             <!----------------------form--------------------------------->
             </div>
            </div>
        </div>
    </div>
    <!-- <section id="footer">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="row">
              <div class="col-lg-6">
               <div class="footer-about">
                <img src="./assets/images/main-logo.png" alt="">
                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>
               </div>
              </div>
              <div class="col-lg-3">
                <div class="footer-main-nav">
                  <nav class="nav flex-column">
                    <a class="nav-link active" href="#">Active</a>
                    <a class="nav-link" href="#">Link</a>
                    <a class="nav-link" href="#">Link</a>
                    <a class="nav-link" href="#">Link</a>
                    <a class="nav-link" href="#">Link</a>
                    <a class="nav-link" href="#">Link</a>
                   
                  </nav>
                </div>
              </div>
              <div class="col-lg-3">
                <div class="footer-course">
                  <nav class="nav flex-column">
                    <a class="nav-link active" href="#">Active</a>
                    <a class="nav-link" href="#">Link</a>
                    <a class="nav-link" href="#">Link</a>
                    <a class="nav-link" href="#">Link</a>
                    <a class="nav-link" href="#">Link</a>
                    
                  </nav>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
     -->
     <?php include 'footer.php';?>
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>