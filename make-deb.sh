#!/bin/bash
PACKAGE_NAME=zphisher
ZPHISHER_VERSION=2.2
PACKAGE_ARCH=all
DISTRO=$(uname -o)


build_package() {
        # define variables depending on detected platform
        distr_name=$1
        if [ "$distr_name" == "Android" ]; then
                platform="Termux"
                path_part="data/data/com.termux/files/"
        else
                platform="Debian"
                path_part=""
        fi
        # print out message with detected platform
        echo "Building .deb package for: $platform"
        # run preparations and build package
        platform=${platform^^}
        mkdir -p ./package/DEBIAN
	mkdir -p ./package/"$path_part"usr/bin
	mkdir -p ./package/"$path_part"usr/opt
	cp -rf ./.package/"$platform"/control ./package/DEBIAN/control
	mkdir -p package/"$path_part"usr/opt/$PACKAGE_NAME
	cp -rf ./LICENSE ./.sites ./.imgs ./zphisher.sh ./package/"$path_part"usr/opt/$PACKAGE_NAME
	cp -rf ./.package/launch.sh ./package/"$path_part"usr/bin/$PACKAGE_NAME
	chmod 755 ./package/DEBIAN
	dpkg-deb --build ./package $PACKAGE_NAME\_$ZPHISHER_VERSION\_$PACKAGE_ARCH.deb
}


# launch the build
build_package $DISTRO
