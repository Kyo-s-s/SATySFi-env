#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <filename>"
  exit 1
fi

filename="$1"

/root/.cargo/bin/satysfi-fmt -i 2 -w "$filename"

sed -i 's/、/，/g; s/。/．/g' "$filename"

if [ $? -ne 0 ]; then
  echo "Error: satysfi-fmt failed for $filename"
  exit 1
fi
