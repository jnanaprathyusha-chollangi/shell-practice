#!bin/bash
###data types##
NUM1=100
NUM2=200
SUM=$(($NUM1+$NUM2))
echo "Sum is : $SUM"

#Arrays
FRUITS=("Apple","Banana","orange")
echo "Fruits are: ${FRUITS{$@}}"