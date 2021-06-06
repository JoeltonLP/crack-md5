#!/bin/bash

hash=$1
wordListName=$2

if [ "$hash" == "" -o "$wordListName" == "" ]
then
    echo ""
    echo "Use ./script [hash] [wordlist]"
else
    for pass in $(cat $wordListName)
    do
        passhash=$(echo -n $pass | md5sum | cut -d " " -f1)
        if [ $passhash == $hash ]
        then
            echo ""        
            echo " [+] Password found: $pass"
            echo ""
            exit
        fi
    done
    echo ""
    echo " [-] Password Not found!"
    echo ""
fi




