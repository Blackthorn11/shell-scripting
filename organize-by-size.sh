#!/bin/bash

if [ $# -ne 2 ]; then
	echo "Invalid numbers of args provided"
	exit 1
fi

if [ ! -d a ]; then
	mkdir small
fi

if [ ! -d b ]; then
        mkdir medium
fi

if [ ! -d c ]; then
        mkdir large
fi

for i in $(find . -maxdepth 1 -type f | grep -v "${0}"); do
	LINES=$(wc -l ${i} | cut -d " " -f1)
	if [ ${LINES} -lt ${1} ]; then
		mv ${i} small/
	elif [ ${LINES} -ge ${1} ] && [ ${LINES} -lt ${2} ]; then
		mv ${i} medium/
	else
		mv ${i} large/
	fi
done

echo "Script '${0}' executed successfully!"

#Description: Based on two input parameters, the script creates three directories, where files are put according to their line count. Dir "small" is created for files with a number of lines less than argument number 1, "medium" is for files whose length is somewhere in between arg 1 and arg 2, and respectfully folder "large" is for files bigger than arg 2
