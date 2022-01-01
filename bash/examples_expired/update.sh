#!bin/bash
for i in $(sqs | grep '2:00:00' | awk '{print $1}');do scontrol update jobid=$i timelimit=12:00:00; done 
