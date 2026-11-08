#!/bin/bash
#takes 2 inputs: username "SSH pub key"
#A short script to add users to a shared linux server
#enter the user and SSH pub key, and it will do the rest.
set -e

adduser --gecos "" "$1" 
mkdir -p /home/"$1"/.ssh
echo "$2" > /home/"$1"/.ssh/authorized_keys
chmod 700 /home/"$1"/.ssh
chmod 600 /home/"$1"/.ssh/authorized_keys
chown -R "$1":"$1" /home/"$1"/.ssh
usermod -aG sudo "$1"
chage -d 0 "$1"


echo "The user $1 has been added, running checks"
grep "$1" /etc/passwd
ls -la /home/"$1"/.ssh
groups "$1"