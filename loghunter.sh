#!/bin/bash

file_path=$1
severity_level=$2

if [ -z "$file_path" ]
then
    echo "File path is missing" 
    exit 1
fi

if [ -z "$severity_level" ]
then
    echo "Severity Level is missing"
    exit 1
fi

current_time=$(date +"%Y-%m-%d_%H-%M")

sorted_report=$( grep -i "$severity_level" "$file_path" | awk -F' ' '{$1=$2=$3=""; print $0}' | sort | uniq -c | sort -rn ) 

if [ -z "$sorted_report" ]
then 
    echo "No $severity_level Found in the logs"
else
    echo "$sorted_report" > ./report-files/loghunter_report_$current_time.txt
fi


