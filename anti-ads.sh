#!/bin/bash

wget http://winhelp2002.mvps.org/hosts.txt -O /tmp/hosts.txt
wget http://paste.desdelinux.net/?dl=4935 -O /tmp/hosts2.txt

ls /etc/hosts.old &> /dev/null
if [ $? -ne 0 ]; then
	cp /etc/hosts /etc/hosts.old
fi 

echo "127.0.0.1       localhost.localdomain   localhost" > /etc/hosts
echo "::1             localhost.localdomain   localhost" >> /etc/hosts
cat /tmp/hosts.txt >> /etc/hosts
cat /tmp/hosts2.txt >> /etc/hosts
rm /tmp/hosts.txt
rm  /tmp/hosts2.txt 
exit
