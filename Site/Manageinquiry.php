<html>
  <?php
  require_once("dbConnection.php");
  $sub_sql = "";
  if(isset($_POST['submit'])){
	 $from=$_POST['from'];
	 $fromArr = explode ("/",$from);
	 $from=$fromArr['2'].'-'.$fromArr['1'].'-'.$fromArr['0'];
	 $from= $from."00:00:00";
	 $to=$_POST['to'];
	 $toArr = explode ("/",$to);
	 $to=$toArr['2'].'-'.$toArr['1'].'-'.$to['0'];
	 $to= $to ."23:59:59";
	 $sub_sql= " where added_on >= '$from' && added_on <= '$to' ";
  }
$result = mysqli_query($mysqli, "SELECT * FROM users ORDER BY id DESC")
?>
<?php
session_start();
if(!isset($_SESSION['loggedin'])){
	echo('you need to login first!');
    header('refresh :2;url=index.php'); 
	exit();
}
?>
<head>
	<title>SideBar Menu</title>
	<link rel="stylesheet" type="text/css" href="./assets/css/back.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-lg-3">
	<div id="sidebar">
        <div class="logo">
            <img src="./assets/images/main-logo.png" alt="">
        </div>
        <div class="menu-link">
		<ul>
        <li class="nav-item">
          <a class="nav-link" href="ManageInquiry.php">Manage Inquiry </a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="ManageCourse.php">Manage Course </a>
        </li>
		<li class="nav-item">
          <a class="nav-link" href="ManageUpcomingevents.php">Manage Upcoming Events </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ManageAnnouncement.php">Manage Announcement </a>
        </li>
				</ul>
    </div>
</div>
</div>
<div class="col-lg-7">
<h1>Manage Inquiry</h1>
<div>
<form method = "Post">
<label for="from">From</label>
<input type="text" id="from" name="from" required>
<label for="to">to</label>
<input type="text" id="to" name="to" required>
<input type="submit" name = "submit" value = "Filter"> 
</form>
</div>
<br/><br/>
<script>
  $( function() {
    var dateFormat = "dd/mm/yy",
      from = $( "#from" )
        .datepicker({
          defaultDate: "+1w",
          changeMonth: true,
          numberOfMonths: 1,
		  dateFormat: "dd/mm/yy",
        })
        .on( "change", function() {
          to.datepicker( "option", "minDate", getDate( this ) );
        }),
      to = $( "#to" ).datepicker({
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
		dateFormat: "dd/mm/yy",
      })
      .on( "change", function() {
        from.datepicker( "option", "maxDate", getDate( this ) );
      });
 
    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }
 
      return date;
    }
  } );
  </script>
	<div class="content">
		<?php  if(mysqli_num_rows($result)>0){?>
    <table width=100%' border=0>
		<tr bgcolor='#DDDDDD'>
			<td><strong>Name</strong></td>
			<td><strong>Email</strong></td>
			 <td><strong>Message</strong></td> 
			<td><strong>Cell No</strong></td>
            <td><strong>Actions</strong></td>
		</tr>
		 <?php
		// Fetch the next row of a result set as an associative array
		while ($res = mysqli_fetch_assoc($result)) {
			 echo "<tr>";
			echo "<td>".$res['name']."</td>";
			echo "<td>".$res['email']."</td>";	
            echo "<td>".$res['message']."</td>";	
            echo "<td>".$res['cellno']."</td>";	
             echo "<td> | 
			<a href=\"deleteinquiry.php?id=$res[id]\" onClick=\"return confirm('Are you sure you want to delete?')\">Delete</a></td>";
		}
		?> 
	</table>
	<?php }
	else {
		echo "No data found";}
?>
	</div>
</div>
<?php
// Assuming you have fetched the username from the database and stored it in $username variable
$username = "Hira"; 
$html = '
<div class="col-lg-2">
	<div class="user-id">
		<h2>Hello ' . $username . '</h2>
		<a href=""><i class="fa-solid fa-right-from-bracket"></i>Sign Out</a>
	</div>
</div>
</div>
</div>
';
echo $html;
?>
</body>
</html>


    
