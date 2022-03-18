#!/bin/bash                                                                                                 

SESSIONNAME="so2"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ]
then	
	echo "Created a new SO2 Session"
	cd /home/$USER/linux
	tmux new-session -s $SESSIONNAME -n 'repo' -d
	
	cd tools/labs
	tmux new-window -t $SESSIONNAME -n 'tools-labs'
	tmux new-window -t $SESSIONNAME -n 'dev' 	
	tmux new-window -t $SESSIONNAME -n 'boot'
	tmux new-window -t $SESSIONNAME -n 'minicom'
fi

tmux attach -t $SESSIONNAME
