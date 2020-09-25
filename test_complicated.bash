#!/usr/bin/env bash

rm -f test.log;
echo "test.log removed!"

if [ -p /dev/stdin ]; then
        echo "Data was piped to this script!"
        # If we want to read the input line by line
        while IFS= read -r line; do
                echo $line | grep ^libc | cut -d':' -f1 | awk '{ print $1}' | tee -a test.log
        done
else
        echo "No input was found on stdin, skipping!"
        # Checking to ensure a filename was specified and that it exists
        if [ -f "$1" ]; then
                echo "Filename specified: ${1}"
                echo "Doing things now.."
                # If we want to read the input line by line
                while IFS= read -r line; do
                        echo $line | grep ^libc | cut -d':' -f1 | awk '{ print $1}' | tee -a test.log
                done < "$1"
        else
                echo "No input given!"
        fi
fi