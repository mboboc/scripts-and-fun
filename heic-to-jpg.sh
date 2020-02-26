#!/bin/bash

COUNT=0
STR="img"
EXT=".JPG"

for f in *.HEIC
do
	echo "Converted $f"
	sudo ./tifig $f "./converted/$STR$COUNT$EXT"
	COUNT=$((COUNT + 1))
done
