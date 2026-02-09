#!bin/bash
###special-variables###

echo "All args/variables passed to script : $@"
echo "Number of variable passed to script: $#"
echo "Script name : $0"
echo "present which directory you are in:$PWD"
echo "who is running this script:$USER"
echo "Home directory of the user:$Home"
echo "PID of the script: $$"
sleep 100 &
echo "Backgroup process id: $!"
echo "All args/variables passed to script : $*"
