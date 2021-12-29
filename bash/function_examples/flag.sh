#!/bin/bash
# This is a script taking flags

while getopts :u:p:g:ab option;do
    case $option in 
        u) user=$OPTARG;;
        p) pass=$OPTARG;;
        g) greet=$OPTARG;;
        a) echo "This is A flag";;
        b) echo "This is B flag";;
        ?) echo "I don't know what $OPTARG is!";;
    esac
done

echo "$greet, User: $user / Pass: $pass"
