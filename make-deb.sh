#!/bin/bash
set -e

# Variables
_PACKAGE="zphisher"
_VERSION="2.3.5"
_ARCH="all"
PKG_NAME="${_PACKAGE}_${_VERSION}_${_ARCH}.deb"
BUILD_DIR="./build_env"
SCRIPT_DIR="./scripts"

# Check dependencies
command -v dpkg-deb >/dev/null 2>&1 || { echo >&2 "dpkg-deb is required but not installed. Aborting."; exit 1; }

# Check existence of launch.sh
if [[ ! -e "${SCRIPT_DIR}/launch.sh" ]]; then
    echo "launch.sh should be in the \`${SCRIPT_DIR}\` directory. Exiting..."
    exit 1
fi

# Environment and Dependency Setup
if [[ "${1,,}" == "termux" || $(uname -o) == *'Android'* ]]; then
    _depend="ncurses-utils, proot, resolv-conf, "
    _bin_dir="data/data/com.termux/files/usr/bin"
    _opt_dir="data/data/com.termux/files/usr/opt/${_PACKAGE}"
fi

_depend+="curl, php, unzip"
_bin_dir+="usr/bin"
_opt_dir+="opt/${_PACKAGE}"

# Directory Setup
rm -rf "${BUILD_DIR}"
mkdir -p "${BUILD_DIR}/${_bin_dir}" "${BUILD_DIR}/${_opt_dir}" "${BUILD_DIR}/DEBIAN"

# Control File Generation
cat <<- CONTROL_EOF > "${BUILD_DIR}/DEBIAN/control"
Package: ${_PACKAGE}
Version: ${_VERSION}
Architecture: ${_ARCH}
Maintainer: @htr-tech
Depends: ${_depend}
Homepage: https://github.com/htr-tech/zphisher
Description: An automated phishing tool with 30+ templates. This Tool is made for educational purpose only!
CONTROL_EOF

cat <<- PRERM_EOF > "${BUILD_DIR}/DEBIAN/prerm"
#!/bin/bash
rm -fr ${_opt_dir}
exit 0
PRERM_EOF

chmod -R 755 "${BUILD_DIR}/DEBIAN"
chmod 755 "${BUILD_DIR}/DEBIAN"{/control,/prerm}

# File Copying
cp -fr "${SCRIPT_DIR}/launch.sh" "${BUILD_DIR}/${_bin_dir}/${_PACKAGE}"
chmod 755 "${BUILD_DIR}/${_bin_dir}/${_PACKAGE}"
cp -fr .github/ .sites/ LICENSE README.md zphisher.sh "${BUILD_DIR}/${_opt_dir}"

# Build Debian Package
dpkg-deb --build "${BUILD_DIR}" "${PKG_NAME}"

# Clean up
rm -rf "${BUILD_DIR}"
