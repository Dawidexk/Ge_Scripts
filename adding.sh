#!/bin/bash


#Hy, this script will add and remove the users, based on the input argument. :)

input_file=$1
operation=$2
first_line_read=false



while IFS=" " read -r line; do
	if [ "$first_line_read" = false ]; then
		group="$line"
		first_line_read=true
	       # echo "$first_line_read"
        elif [ "$operation" = "add" ]; then
			user="$line"
			ssh -p 29418 -n  <server> gerrit set-members -a $user $group 2>&1 
			sleep 2
			echo " DONE "
	elif [ "$operation" = "dell" ]; then
			user="$line"
                        ssh -p 29418 -n  <server> gerrit set-members -r $user $group 2>&1
                        sleep 2
                        echo " DONE "
	
		
fi
done<"$input_file"
