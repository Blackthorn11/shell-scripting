#!/bin/bash

if [ $# -ne 1 ]; then
	echo "Invalid number of args provided. Only 1 needed"
	exit 1
fi

if [ ! -f ${1} ]; then
	echo "Files doesn't exist"
	exit 1
fi
cat ${1} | sort -k2 | awk '{print $2}' | uniq -c | sort -rn | head -n 3 | tr -s " " | awk '{print $2}'
for i in $(cat ${1} | sort -k2 | awk '{print $2}' | uniq -c | sort -rn | head -n 3 | tr -s " " | awk '{print $2}'); do
	echo "count of HTTP/2.0 is $(cat ${1} | grep -E "${i}" | grep "HTTP/2.0" | wc -l)"
	echo "count of non-HTTP/2.0 is $(cat ${1} | grep -E "${i}" | grep -vE "HTTP/2.0" | wc -l)"
	echo ${i}
done

# Description: Based on the format "[IPv4] [Domain Name] - [date] [HTTP_Method resource_identifier protocol(HTTP 1.0/1.1/2.0)] status bytes referer USER_AGENT"
# Note: The format is given by the original task and the test log file was created manually. The log is not system generated.
