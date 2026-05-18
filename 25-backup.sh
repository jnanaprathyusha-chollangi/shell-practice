USERID=$(id -u)
LOGS_FILE=$LOGS_DIR/backup.log"
LOGS_DIR="/var/log/shell-script"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e34m"

mkdir -p $LOGS_DIR

if [ $USERID -ne 0 ]; then 
    echo -e "$R please run the script with user access $N" | tee -a $LOGS_FILE
    exit 1 
fi 

USAGE(){
    echp -e "$R USAGE:: sudo backup <SOURCE_DIR> <DEST_DIR> <DAYS>[default 14 days] $N"
    exit 1 
}

if [ $# -lt 2 ]; then 
    USAGE
fi


