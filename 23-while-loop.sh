#!/bin/bash

while IFS= read -r line; do
  # Process each line here
  echo "$line"
done < 21-script-1.sh # input which file to read