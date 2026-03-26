#!/bin/bash

# Read the first and second arguments from CLI
file_path=$1
severity_level=$2

# Check whether file_path is empty or not
if [ -z "$file_path" ]
then
    echo "File path is missing" 
    exit 1
fi

# Check whether severity_level is empty or not
if [ -z "$severity_level" ]
then
    echo "Severity Level is missing"
    exit 1
fi

# Store current time in Year-Month-Day_Hour-Minute format
current_time=$(date +"%Y-%m-%d_%H-%M")

# Store and find the severity level from the logs file. Also deduplicate and count them
sorted_report=$( grep -i "$severity_level" "$file_path" | awk -F' ' '{$1=$2=$3=""; print $0}' | sort | uniq -c | sort -rn ) 

# Check whether logs have desired severity_level or Not
if [ -z "$sorted_report" ]
then 
    echo "No $severity_level Found in the logs"
else
    echo "$sorted_report" > ./report-files/loghunter_report_$current_time.txt
fi