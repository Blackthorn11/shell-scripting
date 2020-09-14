#!/bin/bash

for i in $(find . -maxdepth 1 -type l); do
	if [ ! -e ${i} ]; then
		echo "Link ${i} is broken"
	fi
done

echo "Script reached the end successfully!"

# Description: The scripts outputs broken symlinks within the script's folder
