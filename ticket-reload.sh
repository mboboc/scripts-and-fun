#!/bin/bash

# Usage: bash ticket-reload.sh
while true; do
	currenttime=$(date +%H:%M)
	echo $currenttime
	if [[ "$currenttime" == "16:00" ]]
	then
		xdg-open https://www.ticketmaster.es/event/ateez-tickets/30311?language=en-us
		break
	fi
done
