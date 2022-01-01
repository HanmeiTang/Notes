#!/bin/bash/
# This is anotehr version of select.

select option in "cat" "bird" "quit"
do
    case $option in
        cat) echo "Cats like to sleep.";;
        bird) echo "Birds like to sing.";;
        quit) break;;
        *) echo "I don't understand.";;
    esac
done
