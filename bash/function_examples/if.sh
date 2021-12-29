#!/bin/bash
# This is a basic bash script
a=5
if [ $a -gt 4 ];then
    echo $a is greater than 4!
else
    echo $a is not greater than 4!
fi

b="This is my stringi#2!"
if [[ $b =~ [0-9]+ ]];then
    echo "There are numbers in the string: $b"
else
    echo "There are no numbers in the string: $b"
fi
