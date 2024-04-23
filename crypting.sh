#!/bin/bash


#Hy, this script was Paul's ideea and it's encrypting some files.
#You must give the script some elements like : encrypt/decrypt ; file-name ; output-file-name ; a password to crypt and decrypt the file; :)

comand="$1"
input_file="$2"
output_file="$3"
pass="$4"


function usage {

    echo "Usage: $0 <command> <input_file> <output_file> <password>"
    echo "Commands:"
    echo "$0 encrypt <input_file> <output_file> <password>   Encrypt a file"
    echo "$0 decrypt <input_file> <output_file> <password>   Decrypt a file"
    exit 1
}

function encrypt_file {

openssl enc -aes-256-cbc -salt -in "$input_file" -out "$output_file" -iter 2 -k "$pass"

}

function decrypt_file {

if ! openssl enc -aes-256-cbc -d -salt -in "$input_file" -out "$output_file" -iter 2 -k "$pass" ; then
        echo "Error: Decryption failed. Please add the correct password"
        else openssl enc -aes-256-cbc -d -salt -in "$input_file" -out "$output_file" -iter 2 -k "$pass";
fi

}

if [[ $# -lt 4 ]]; then
        usage
elif [[ $comand == encrypt ]]; then
        encrypt_file
elif [[ $comand == decrypt ]]; then
        decrypt_file
else
        echo "Something is wrong, please investigate the script"
fi

