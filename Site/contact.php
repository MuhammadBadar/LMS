<!doctype html>
<head>
  <title>Conctact - Qamsoft</title>
</head>
<html lang="en">
  <?php include 'header.php';?>
  <?php
session_start();
require_once("dbconnection.php");
?>
     <section id="contact-bar">
     <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="contact-bar">
            <h2>Contact Us</h2>
          </div>
        </div>
      </div>
     </div>
     </section>
     <div class="container">
        <div class="row">
          <div class="col-lg-7">
            <div class="contact-head">
              <h1>Get In Touch With Us</h1>
              <p>At QamSoft, we offer more than just courses – we deliver transformative experiences. Our faculty comprises luminaries in the programming world, whose proficiency is matched only by their passion for teaching. With meticulously crafted curricula, hands-on projects, and real-world simulations, our students are exposed to the dynamic challenges they will face in their careers.</p>
</div>
            <div class="row">
              <div class="col-lg-2">
                <div class="contact-icon">
                  <i class="fa-solid fa-house"></i>
                </div>
              </div>
              <div class="col-lg-10">
                <h3>Head Office</h3>
                <p>508-A, Siddique Trade Center, Gulberg 2 Lahore, Pakistan</p>
                <p><b>Phone:</b> +92 323 4027206, +92 309 4052891</p>
                <p><b>Email:</b> info@qamsoft.com</p>
				<p><b>Blog:</b> badar@qamsoft.com</p>
              </div>
              </div>
              <div class="row contact-home">
              <div class="col-lg-2">
                <div class="contact-icon">
                  <i class="fa-solid fa-house"></i>
                </div>
              </div>
              <div class="col-lg-10">
                <h3>Branch Office</h3>
                <p>Fatima Heights near Nobal Hospital, Rehmanpura Lahore, Pakistan</p>
                <p><b>Phone:</b> +92 323 4027206, +92 309 4052891</p>
                <p><b>Email:</b> info@qamsoft.com</p>
				<p><b>Blog:</b> badar@qamsoft.com</p>
              </div>
</div>
            </div>
          <div class="col-lg-5">
            <div class="contact-form">
            
            <form action="contactAction.php" method="POST">
                <h3>Post Inquiry </h3>
              <div class="form-group">
                
                <input type="text" class="form-control"   name="name"id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Your Name" required>
                
              </div>
              <div class="form-group">
                
                <input type="email" class="form-control" name="email" id="exampleInputPassword1" placeholder="Your Email" required>
              </div>
              <div class="form-group">
                
                <input type="phone number" class="form-control" name="cellno" id="exampleInputPassword1" placeholder="Phone number" required>
              </div>
              <div class="form-group">
               
                <textarea class="form-control" name="message" id="exampleFormControlTextarea1" rows="3" placeholder="Your Message"></textarea>
              </div>
              <input value="Post" name="submit" type="submit" class="landing-form-btn">
              <div class="after-message-contact">
  <p><?php
if(isset($_SESSION['status'])){
echo $_SESSION['status'];
unset( $_SESSION['status']);
}
?></p>
</div>
          
            </form>
          </div>
          </div>
        </div>
       </div>
       <?php include 'footer.php';?>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>