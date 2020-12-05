#!/bin/bash

###
# This script will automatically generate accounts, provision random passwords, and add the accounts t>
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
