#!/bin/bash

if [ $# -ne 0 ]; then
	echo "Script needs no arguments."
	exit 1
fi

for i in $(find ../ -type f -name "*-*.sh"); do
	if [ "${0}" == "${i}" ]; then
		continue
	fi
	mv ${i} .
done

# Description: Collection of files with the format [part-of-name]-[part-of-name].sh
