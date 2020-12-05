#!/bin/bash

###
# Generates five user accounts using random passwords 
# Script is designed to run during deployment (e.g. via EC2 user-data) so that users on each Kali box has unique creds
# Account details are echo'd to stdout and available in the initial deployment logs (make sure this is an acceptable risk for your setup)
###

function rand_pass {
 head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12 ; echo ''
}

usernames=("cat" "dog" "mouse" "llama" "horse")
echo "***Connection Information***"
echo "IP Address: $(curl http://169.254.169.254/latest/meta-data/public-ipv4)" 

for i in "${usernames[@]}"
do
    username=$i
    randompw=$(rand_pass)
    useradd -m -s /bin/bash $username
    echo $username:$randompw |  chpasswd
    usermod -aG sudo $username
    echo "User:" $username
    echo "Password:" $randompw 
done
