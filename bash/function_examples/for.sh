#!/bin/bash
# This is for loop script
echo ----------------------------------
echo "for loop examples"
echo ----------------------------------

echo "Loop literally:"
for i in 1 2 3
do 
    echo $i
done
echo ----------------------------------

# For bash 4.1.2 {1..100..2} is recognized
# Not for bash 3.2 (OSX)
echo 'Loop using {} format:'
for i in {1..10}
do
    echo $i
done
echo ----------------------------------

# Another syntax similar to C
echo "Loop using C syntax:"
for (( i=1; i<=10; i++ ))
do
    echo $i
done
echo ----------------------------------

# Loop in an array
echo "Loop in an array:"
arr=("one" "two" "three")
for i in ${arr[@]}
do
    echo $i
done
echo ----------------------------------

# Loop in an associative array (bash4 or higher only)
# You will see error message on OSX:
#   -bash: declare: -A: invalid option
#   declare: usage: declare [-afFirtx] [-p] [name[=value] ...]
echo "Loop in an associative array:"
declare -A arr
arr["name"]="Hanmei"
arr["pid"]="A53083554"
for i in "${!arr[@]}"  # exclamation mark to access keys
do
    echo "$i: ${arr[$i]}"
done
echo ----------------------------------

# Loop using command substitution
echo "Loop using command substitution:"
for i in $(ls)
do
    echo $i
done
echo ----------------------------------
