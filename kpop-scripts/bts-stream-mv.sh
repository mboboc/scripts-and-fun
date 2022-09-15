#!/bin/bash

IFS=' '
while true; do
	xdg-open https://www.youtube.com/watch?v=yxfCbV21ck8
	t=$((360 + RANDOM % 10))
	sleep $t
	var=$(pidof chrome)
	for i in "${var[@]}"; do	
		kill $i
	done
done
