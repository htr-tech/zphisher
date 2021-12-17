#!/bin/bash
PACKAGE_NAME=zphisher
ZPHISHER_VERSION=2.2
PACKAGE_ARCH=all
DISTRO=$(uname -o)

echo "Building Zphisher deb package..."

build_termux(){
	mkdir -p ./package/DEBIAN
	mkdir -p ./package/data/data/com.termux/files/usr/bin
	mkdir -p ./package/data/data/com.termux/files/usr/opt
	cp -rf ./.package/TERMUX/control ./package/DEBIAN/control
	mkdir -p package/data/data/com.termux/files/usr/opt/$PACKAGE_NAME
	cp -rf ./LICENSE ./.sites ./.imgs ./zphisher.sh ./package/data/data/com.termux/files/usr/opt/$PACKAGE_NAME
	cp -rf ./.package/launch.sh ./package/data/data/com.termux/files/usr/bin/$PACKAGE_NAME
	chmod 755 ./package/DEBIAN
	dpkg-deb --build ./package $PACKAGE_NAME\_$ZPHISHER_VERSION\_$PACKAGE_ARCH.deb

}

build_linux(){
	mkdir -p ./package/DEBIAN
        mkdir -p ./package/usr/bin
        mkdir -p ./package/usr/opt
        cp -rf ./.package/TERMUX/control ./package/DEBIAN/control
        mkdir -p package/usr/opt/$PACKAGE_NAME
        cp -rf ./LICENSE ./.sites ./.imgs ./zphisher.sh ./package/usr/opt/$PACKAGE_NAME
        cp -rf ./.package/launch.sh ./package/usr/bin/$PACKAGE_NAME
        chmod 755 ./package/DEBIAN
        dpkg-deb --build ./package $PACKAGE_NAME\_$ZPHISHER_VERSION\_$PACKAGE_ARCH.deb
}

if [ $DISTRO == Android ]; then
        build_termux
else
        build_linux
fi
