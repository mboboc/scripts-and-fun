#!/bin/bash

# Find all the hosts connected to the specified network
# Provide an ip with a mask as arguments
# 192.168.0.0/24
if [ $# -eq 0 ]
  then
    echo "Usage: ./hosts_localnetwork.sh 192.168.1.0/24"
    echo "If this doesnt work, check your ip addres."
    exit 1
fi
sudo nmap $1 -n -sP --disable-arp-ping | grep report | awk '{print $5}'
