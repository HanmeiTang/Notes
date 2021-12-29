#!/bin/bash/
# This is a basic bash script using select.

select animal in "cat" "dog" "bird" "quit"
do
    echo "Your selected $animal!"
    break
done
