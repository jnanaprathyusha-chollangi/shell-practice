#!bin/bash
NUMBER=$779
# -gt -> gerather than
# -lt -> less than
# -eq -> equal
#-ne -> not equal
if [$NUMBER -gt 1000]; then
    echo "given number is greater than:$NUMBER"
elif [$NUMBER -lt 1000] ; then 
    echo "given number is less than:$NUMBER"
fi