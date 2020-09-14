#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Invalid number of args."
	exit 1
fi

ps -e -o uid,pid,rss | tail -n +2 | sort -n -k1 > temp.txt

while read line; do
	USER=$(echo ${line} | awk '{print $1}')
	USERFILE="uid${USER}.txt"
	INFO=$(echo ${line} | awk '{print $2, $3}' | sort -n -k2)
	echo -e "${INFO}" >> "${USERFILE}"	
done< <(cat temp.txt)

for i in $(find . -maxdepth 1 -type f -name "uid*.txt"); do
	cat ${i} | sort -r -k2 > permo.txt
	SUM=0
	for j in $(cat permo.txt | cut -d " " -f2); do
		SUM=$(( ${SUM}+${j} ))
	done
	echo "${i} with sum ${SUM}"
	if [ ${SUM} -gt ${1} ]; then
		BIG=$(cat permo.txt | cut -d " " -f1 | head -n 1)
		echo "User with id ${i} needs to terminate process with PID: ${BIG}"
	fi
	rm permo.txt
done


rm temp.txt
rm uid*
echo -e "\n\n Script executed successfully! \n"

# Description: The scripts outputs a list of processes with bigger RSS number than the provided argument.
