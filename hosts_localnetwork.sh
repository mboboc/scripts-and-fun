#!/bin/bash

# Find all the hosts connected to the specified network
# Provide an ip with a mask as arguments

nmap $1 -n -sP | grep report | awk '{print $5}'
