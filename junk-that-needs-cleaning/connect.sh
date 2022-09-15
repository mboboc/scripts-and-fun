#!/bin/bash

# Compute the network based on the current IP address
IP=$(hostname -I | cut -d " " -f 1)
IP_chunk=$(echo $IP | cut -d "." -f 4 --complement)
ZERO=".0"
NETWORK="${IP_chunk}${ZERO}"
SUCCESS_STRING=" 0%"
MASK="/24"

# Last number from IP
GPS_server=.129
RC_car=.69

if [[ $# -eq 0 ]]
then
  printf "Usage:\n \
  ./connect car     - connect to RC car via SSH\n \
  ./connect server  - connect to GPS server via SSH\n \
  ./connect search  - search for IP addresses\n"
else
  if [[ $1 == "car" ]]
  then
    ip="${IP_chunk}${RC_car}"
    echo "RC car: $ip"
  elif [[ $1 == "server" ]]
  then
    ip="${IP_chunk}${GPS_server}"
    echo "GPS server: $ip"
  elif [[ $1 == "search" ]]
  then
    echo "Searching $NETWORK..."
    sudo nmap $NETWORK$MASK -n -sP --disable-arp-ping | grep report | awk '{print $5}'
    exit 0
  fi

  if [[ $output == *$SUCCESS_STRING* ]]
  then
    is_valid=1
  fi

  output=$(ping -c1 -W1 $ip)

  if [[ $is_valid -eq 1 ]]
  then
    ssh $ip -X
  else
    echo "$ip is not connected to the network."
  fi
fi
