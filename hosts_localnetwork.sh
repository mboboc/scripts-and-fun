#!/bin/bash

# Find all the hosts connected to the specified network
# Provide an ip with a mask as arguments

sudo nmap $1 -n -sP --disable-arp-ping | grep report | awk '{print $5}'
