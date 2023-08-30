<head>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="icon" type="image/x-icon" href="./assets/images/fav.png">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
  <link rel="stylesheet" href="./assets/css/header.css">
  <link rel="stylesheet" href="./assets/css/contact.css">
  <link rel="stylesheet" href="./assets/css/courses.css">
  <link rel="stylesheet" href="./assets/css/style.css">
  <link rel="stylesheet" href="./assets/css/upcomingevents.css">
  <link rel="stylesheet" href="./assets/css/videolec.css">
  <link rel="stylesheet" href="./assets/css/login.css">
  <link rel="stylesheet" href="./assets/css/single-course.css">
  <link rel="stylesheet" href="./assets/css/footer.css">
  

  
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
  


</head>
<body>

 
<!----------navbar-->
<section id="navbar">
<div class="container-fluid">
<nav class="navbar navbar-expand-lg">
  <a class="navbar-brand" href="index.php"><img src="./assets/images/main-logo.png" alt="logo" class="img-fluid"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      

    <li class="nav-item">
        <a class="nav-link" href="index.php">Home</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="courses.php">Courses</a>
      </li>

      <li class="nav-item">
        <a class="nav-link" href="schedual.php">Upcoming Events </a>
      </li>

      
      <li class="nav-item">
          <a class="nav-link" href="contact.php">Contact Us</a>
        </li>



        <li class="nav-item sign-in-li">
          <?php
            if(isset($_SESSION['loggedin'])){
          ?>
          <a class="nav-link" href="ManageCourse.php">Go to Backoffice</a>
          <?php }else{ ?>
            <a class="nav-link" href="login.php">Sign In</a>
            <?php } ?>
        </li>
      
      
        
        
      

        
        
    </ul>
    
  </div>
</nav>
</div>
</section>