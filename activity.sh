#!/bin/bash

#Hy, this script reads from a list the user ID's and outputs a list with the details of the users ! :)

input_file="user_ids.txt"
output_file="output6.txt"
system_file="system1.txt"

while IFS=""  read -r line; do
        status1=$( ssh -n -q -p 29418 <server> admin-console show-account $line 2>&1 | grep  Active: | cut -c  20-24)
        sleep 1
        name=$( ssh -n -q -p 29418 <server> admin-console show-account $line 2>&1 | grep "Full")
        sleep 1
        newname=$(echo $name | sed 's/^[ ]*//;s/[ ]*$//;s/Full name:/ /')
        if [[ $status1 == 'true' ]]; then
                 echo "$line $newname is active" >>"$output_file"
                elif [[ $status1 == 'false' ]];
                then
                 echo "$line $newname is inactive" >>"$output_file"
                else
                 echo "$line   Ghost user" >>"$output_file"
        fi

done<"$input_file"
