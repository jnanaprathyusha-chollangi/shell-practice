#!bin/bash

while IFS=read -r line;
do
    #process each line here 
    echo "$line"
done < 21-script-1.sh