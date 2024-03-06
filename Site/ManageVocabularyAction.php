<html>
<head>
	<title>Add Data</title>
</head>

<body>
<?php
// Include the database connection file
require_once("dbConnection.php");

if (isset($_POST['submit'])) {
	// Escape special characters in string for use in SQL statement	
	$word = mysqli_real_escape_string($mysqli, $_POST['Word']);
	$enghlishMeaning = mysqli_real_escape_string($mysqli, $_POST['EnglishMeaning']);
	$urduMeaning = mysqli_real_escape_string($mysqli, $_POST['UrduMeaning']);
	$Sentence = mysqli_real_escape_string($mysqli, $_POST['Sentence']);
	$pronounciation = mysqli_real_escape_string($mysqli, $_POST['pronounciation']);
	$difficultyLevelId = (int)$_POST['DifficultyLevelId'];
	echo $difficultyLevelId;
	//$logopath = $_FILES['LogoPath']['name'];
	//echo $enghlishMeaning;
	//echo $urduMeaning;
	// Check for empty fields
	if (empty($word) || empty($enghlishMeaning)) {
		if (empty($word)) {
			echo "<font color='red'>Word field is empty.</font><br/>";
		}
		
		if (empty($enghlishMeaning)) {
			echo "<font color='red'>English Meaning field is empty.</font><br/>";
		}
		
		if (empty($urduMeaning)) {
			echo "<font color='red'>Urdu Meaning field is empty.</font><br/>";
		}
		
		if (empty($Sentence)) {
			echo "<font color='red'>Sentence field is empty.</font><br/>";
		}
		if (empty($pronounciation)) {
			echo "<font color='red'>Pronunciation field is empty.</font><br/>";
		}
		// Show link to the previous page
		// echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		
		//if(isset($_GET['Word']))
		//{
			// Edit Mode
		//	$result = mysqli_query($mysqli, "update vocabulary set EnglishMeaning = '$enghlishMeaning' , UrduMeaning = '$urduMeaning' where Word = '$word';");
		//}
		//else
		//{
				$result = mysqli_query($mysqli, "INSERT INTO vocabulary (`word`, `englishMeaning`, `UrduMeaning`,`DifficultyLevelId`, `Sentence`, `pronounciation`) VALUES ('$word', '$enghlishMeaning', '$urduMeaning', '$difficultyLevelId', '$Sentence', '$pronounciation')");
		//}
				header('location: ManageVocabulary.php');		// Display success message
		
	}
}
else if (isset($_POST['update'])) {
	$word = mysqli_real_escape_string($mysqli, $_POST['Word']);
	$enghlishMeaning = mysqli_real_escape_string($mysqli, $_POST['EnglishMeaning']);
	$urduMeaning = mysqli_real_escape_string($mysqli, $_POST['UrduMeaning']);
	$Sentence = mysqli_real_escape_string($mysqli, $_POST['Sentence']);
	$pronounciation = mysqli_real_escape_string($mysqli, $_POST['pronounciation']);
	$difficultyLevelId = (int)$_POST['DifficultyLevelId'];
	echo $difficultyLevelId;
	//$logopath = $_FILES['LogoPath']['name'];
	//echo $enghlishMeaning;
	//echo $urduMeaning;
	// Check for empty fields
	if (empty($word) || empty($enghlishMeaning)) {
		if (empty($word)) {
			echo "<font color='red'>Word field is empty.</font><br/>";
		}
		
		if (empty($enghlishMeaning)) {
			echo "<font color='red'>English Meaning field is empty.</font><br/>";
		}
		
		if (empty($urduMeaning)) {
			echo "<font color='red'>Urdu Meaning field is empty.</font><br/>";
		}
		
		if (empty($Sentence)) {
			echo "<font color='red'>Sentence field is empty.</font><br/>";
		}
		if (empty($pronounciation)) {
			echo "<font color='red'>Pronunciation field is empty.</font><br/>";
		}
		// Show link to the previous page
		// echo "<br/><a href='javascript:self.history.back();'>Go Back</a>";
	} else { 
		
		$result = mysqli_query($mysqli, "update vocabulary set EnglishMeaning = '$enghlishMeaning' , UrduMeaning = '$urduMeaning', Sentence = '$Sentence' , pronounciation = '$pronounciation' where Word = '$word';");
		header('location: ManageVocabulary.php');		// Display success message
		
	}
}
?>
</body>
</html>
