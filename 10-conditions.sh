#!bin/bash
NUMBER=$779
# -gt -> gerather than
# -lt -> less than
# -eq -> equal
#-ne -> not equal
if [$NUMBER -gt 1000]; then
 echo "given is greather than:$NUMBER"
elif [$NUMBER -lt 1000] ; then 
 echo "given number is less than:$NUMBER"
elif [$NUMBER -eq 1000] ; then 
 echo "given number equal to :$NUMBER"
else 
 echo "given number is not equal:$NUMBER"
fi