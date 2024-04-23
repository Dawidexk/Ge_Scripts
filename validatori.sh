#!/bin/bash

# This script has 2 arguments, if you use 1, it will enable the plugins from the servers, only its-jira.jar and jira-validator.jar.If you use 2 it will disable the plugins.
# The servers must be added in a input file text .n

input_file=$1
input_option=$2



        if [[ "$2" -eq 2 ]]; then
                while IFS="  " read -r line; do
                ssh -n gitms@$line 'mv /home/gitms/gerrit_application/plugins/its-jira.jar /home/gitms/gerrit_application/plugins/its-jira.jar.disabled && mv /home/gitms/gerrit_application/plugins/jira-validator.jar /home/gitms/gerrit_application/plugins/jira-validator.jar.disabled'
                sleep 5
                done<"$input_file"
        elif [[ "$2" -eq 1 ]]; then
                while IFS="  " read -r line; do

                ssh -n gitms@$line 'mv /home/gitms/gerrit_application/plugins/its-jira.jar.disabled /home/gitms/gerrit_application/plugins/its-jira.jar && mv /home/gitms/gerrit_application/plugins/jira-validator.jar.disabled /home/gitms/gerrit_application/plugins/jira-validator.jar'
                sleep 5
                done < "$input_file"
        else
                echo "This will never happen :)"
        fi
echo " ACE! "
