#!/bin/sh

if [ $# -ne 2 ]; then 
    echo "number of arguments are: " $#
    echo "Two argunents required"
    echo "Usages: $0 <filedir> <searchstr>"
    exit 1
fi

filedir="$1"
searchstr="$2"

# echo $filedir $searchstr

if [ ! -d "$filedir" ]; then
    echo "$filedir is not a directory"
    exit 1

fi

file_count=$(find "$filedir" -type f 2>/dev/null | wc -l)

match_count=$(grep -r "$searchstr" "$filedir" 2>/dev/null | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count"