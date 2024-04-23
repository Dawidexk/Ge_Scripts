#!/bin/bash
#This is a script that makes a back-up of a database declared in the variable "NAME".
#If you give with this script 2 arguments, like the name of a dump file from your "~" and after one option ( ex: 1 ), this script will also create a new database from the dump.
#If you use .my.conf you can store your database credentials so no password is required in the script.

USER="uie52923"
NAME="Back"
BACKUP="/home/uie52923"
DATE=$(date +"%Y-%m-%d")
OPTION=$1
OPTION1=$2

mkdir -p $BACKUP

function bri()  {
                echo -e "\033[1;7;94m$*\033[0m"
                }

mysqldump -u "$USER" "$NAME" >"$BACKUP"/"$NAME"_backup_"$DATE".sql


function blu()  {
                echo -e "\033[1;7;36m$*\033[0m"
                }

bri "Back-up for the database named "$NAME" saved as "$DATE"_backup_"$DATE" in "$BACKUP".  "

function option() {
                  blu "Please add a name for the new Database: "
                  read NEWDATABASE
                  mysql -u "$USER"  -e "CREATE DATABASE IF NOT EXISTS $NEWDATABASE;"
                  mysql -u "$USER"  "$NEWDATABASE" < "$BACKUP"/"$OPTION".sql
                  }


if [[ "$2" -eq 1 ]]; then
        blu "The script will create a new Database and put the back-up "$OPTION" in it. "
        option
        bri "Done !"
else
        bri "Done !"
fi
