#!/bin/bash
# This is a bash script taking arguments.

for i in $@
do
    echo $i
done

echo "There are $# arguments."
