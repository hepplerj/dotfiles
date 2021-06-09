#!/bin/bash 

if [ $# -eq 0 ]
then
    /bin/ls -p | grep -v / | sort -R | tail -n 1
else
    targetpath="$(realpath $@)"
    file="$(/bin/ls -p "$targetpath" | grep -v / | sort -R tail -n 1)"
    printf "%s%s" "$targetpath" "$file"

fi
