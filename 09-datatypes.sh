#!bin/bash
###data types##
NUM1=100
NUM2=200
SUM=$(($NUM1+$NUM2))
echo "Sum is : $SUM"

#Arrays
FRUITS=("Apple" "Banana" "orange")
echo "fruits are :${FRUITS[@]}"
echo "Fruit name is : ${FRUITS[0]}"
