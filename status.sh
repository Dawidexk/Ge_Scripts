#!/bin/bash

#This script makes a check, and it will verify if the servers are online or not.

servers=("<Server1>" "<Server2>")

for server in  ${servers[@]}; do


                response=$( curl -Isk  $server | head -n1 | cut -d' ' -f2)

        if [[ $response -eq 200 ]]; then
                echo  "$server works "
        elif [[ $response -eq 502 ]]; then
                echo "$server does not give any response: $response"

        fi

done
