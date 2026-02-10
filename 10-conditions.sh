#!/bin/bash

NUM=779
if [ $NUM -gt 779];then
    echo "given number is greater than: $NUM"
elif [ $NUM -lt 779];then
    echo "given number is less then: $NUM"
else 
    echo "given number is equal to : $NUM"
fi