#!/bin/bash
#####################################################
# Purpose: build vpn connection
# Author: Fu-Ming Tsai
# Note : this ping remote IP ok. else it will try to build vpn connection
# Last updated on : 2014/01/07
#####################################################

PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/etc/vpnc
export LC_ALL=en_US.UTF-8
vpn_ip=202.153.194.30
id=office
passwd=1j6ul4jp4ji3
declare -i sum=0

sum=$(ping -c 5 -W 1 10.0.6.12 | grep 'received' | awk -F',' '{ print $2 }' | awk '{ print $1 }')
if [ $sum -eq 0 ]; then
    echo "TW VPN connection failed!! NOW running $0"
    vpnc-disconnect
    vpnc
fi

cp /home/ec2-user/vpn/resolv.conf /etc/resolv.conf
