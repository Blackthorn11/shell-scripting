#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Invalid number of args provided"
	exit 1
fi

LIST=""

for i in $(find . -maxdepth 1 -type f -name "*.pdf" | sort -d); do
	LIST+="$(basename ${i}) "
done

pdfunite ${LIST} ${1}

# Description: Purpose of the script - Merging all PDF files in the current directory with them being sorted in alphabetical order. The output file name is given by the user as an input argument when starting the script. It must contain the extention of the file, which is .pdf
