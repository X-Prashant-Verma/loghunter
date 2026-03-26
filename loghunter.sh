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


