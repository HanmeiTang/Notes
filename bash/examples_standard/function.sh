#!/bin/bash
# This is a bash script to show function.

# Greeting function
echo "This is a greeting function."
function greet {
    echo "Hi there, $1! What a nice $2!"
}

echo "And now, a greeting!"
greet Hanmei Morning
echo

# Counting function
echo "This is a counting function."
function numberthings {
    i=1
    for f in $@; do
        echo $i: $f
        ((i+=1))
    done
}

numberthings $(ls)
echo 
numberthings pine birch maple spruce
