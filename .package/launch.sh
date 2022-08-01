#!/bin/bash

DISTRO=$(uname -o)

if [ $DISTRO == Android ]; then
	export ZPHISHER_ROOT="/data/data/com.termux/files/usr/opt/zphisher"
else
	export ZPHISHER_ROOT="/usr/opt/zphisher"
fi

cd $ZPHISHER_ROOT
bash ./zphisher.sh
