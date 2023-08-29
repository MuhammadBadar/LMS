<!doctype html>
<head>
  <title>UPCOMING EVENTS - QamSoft</title>
</head>
<html lang="en">
    <?php include 'header.php';?>
	<?php
require_once("dbConnection.php");
$result = mysqli_query($mysqli, "SELECT * FROM events");
?>
    
    <section id="bar-sch">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="bar-sch">
              <h2>UpComing Events</h2>
            </div>
          </div>
        </div>
      </div>
    </section>

   <div class="container">
  <div class="row">
    <div class="col-lg-12">
    <div class="row">
    <?php while($resultData = mysqli_fetch_array($result)) { ?>
    <?php
        // Get the current date
        $currentDate = date('Y-m-d');

        // Compare the end date of the event with the current date
        $endDate = $resultData['endTime'];
        $eventExpired = strtotime($currentDate) > strtotime($endDate);
    ?>
    
    <?php if (!$eventExpired) { ?>
      
        <div class="col-lg-4">
            <div class="angular">
                <!---course------>
                <div class="card">
                    <div class="card-body">
                      <div class="event-bg">
                       <div class="event-title">
                        <?php 
                           echo "EventTitle: " . $resultData['eventTitle'] . "<br>";
                           ?>
                           </div> 
                           <?php 
                            echo "EventPlace: " .$resultData['eventPlace'] . "<br>";
                            echo"StartTime: " . $resultData['startTime'] . "<br>";
                            echo "EndTime: " . $resultData['endTime'] . "<br>";
                            echo "Date: " . $resultData['eventDate'] . "<br>";
                        ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        
    <?php } ?>
<?php } ?>

          </div>
          </div>
        </div>
      </div>
      <?php include 'footer.php';?>
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>