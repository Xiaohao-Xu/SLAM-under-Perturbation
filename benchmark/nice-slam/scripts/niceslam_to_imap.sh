#!/bin/bash

# Check if both input and output file names are provided
if [ $# -ne 2 ]; then
  echo "Usage: $0 <input_file> <output_file>"
  exit 1
fi

# Input file
input_file="$1"

# Output file
output_file="$2"

# Loop through each line of the input file
while IFS= read -r line; do
  if [[ $line == python* ]]; then
    # Line starts with "python "
    line="$line --imap"
  fi
  echo "$line" >> "$output_file"
done < "$input_file"
