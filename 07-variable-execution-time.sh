#!bin/bash
START_TIME=$(date +%s)

echo "Script executed at : $START_TIME"

sleep 10 
END_TIME=$(date +%s)
echo "Script execution end at: $END_TIME"

TOTAL_TIME=$(($END_TIME-$START_TIME)) 
echo "Total script executed time in: $TOTAL_TIME Seconds"