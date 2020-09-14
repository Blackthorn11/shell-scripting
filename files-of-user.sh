#!/bin/bash

if [ $# -ne 0 ]; then
	echo "Script needs no args"
	exit 1
fi

#for i in $(ls -l | tail -n +2); do
#	if [ $(whoami)==$(echo ${i} | cut -d " " -f3) ]; then
#		echo ${i} | cut -d " " -f9
#	fi
#done

while read i; do
	if [ $(whoami)==$(echo ${i} | cut -d " " -f3) ]; then
                echo ${i} | cut -d " " -f9
        fi
done< <(ls -l | tail -n +2)

# Description: The script outputs the files within the script's directory that are owned by the user who is executing the script. 
