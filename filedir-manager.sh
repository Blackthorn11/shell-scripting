#!/bin/bash

if [ $# -ne 0 ]; then
	echo "No args needed for the execution of this script"
	exit 1
fi

for i in $(find . -maxdepth 1 -type f); do
	if [ "${0}" == "${i}" ]; then
		continue
	fi
	EXTENTION="${i##*.}"
	if [ ! -d ${EXTENTION} ]; then
		mkdir ${EXTENTION}
	fi
	if [ ${EXTENTION} == "" ]; then
		mv "${i}" "NO_EXTENTION/"
	else
		mv "${i}" "${EXTENTION}/"
	fi
done

# Description: The script creates a system of folders based on the extentions of the files within the current directory
