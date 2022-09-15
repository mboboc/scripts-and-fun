#!/bin/bash

# Usage: bash ticket-reload.sh
wanted="16:00"
while true; do
	currenttime=$(date +%H:%M)
	echo "[$currenttime] Waiting for $wanted..."
	if [[ "$currenttime" > "$wanted" ]]
	then
		echo "Time set is after the current time"
		break
	fi
	if [[ "$currenttime" == "$wanted" ]]
	then
		xdg-open https://www.ticketmaster.es/event/ateez-tickets/30311?language=en-us
		break
	fi
done
