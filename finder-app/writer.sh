#!/bin/sh

# Check if both arguments are provided
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required"
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

# Extract directory path from the full file path
writedir=$(dirname "$writefile")

# Create directory path if it doesn't exist
mkdir -p "$writedir" 2>/dev/null
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory path $writedir"
    exit 1
fi

# Write content to file (overwrite if exists)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not write to file $writefile"
    exit 1
fi

exit 0