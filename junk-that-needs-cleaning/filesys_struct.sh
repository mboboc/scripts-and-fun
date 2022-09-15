#!/bin/bash

VAR1="lab0"
VAR2="lab"
README="README_"
AUX="/"
MD=".md"

for i in `seq 1 9`;
do
	LAB=$VAR1$i
	mkdir $LAB
	echo "Created directory: " $LAB
	touch $LAB$AUX$README$LAB$MD
        echo "Created file: " $LAB$AUX$README$LAB$MD	
done
