#!/bin/bash
# This is a bash script for case.
a="puppy"
case $a in
    cat) echo "Feline";;
    dog|puppy) echo "Canine";;
    *) echo "No match!";;
esac
