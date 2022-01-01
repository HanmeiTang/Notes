#!/bin/bash

# 0 6 * * * ssh hat003@comet.sdsc.edu 'bash /home/hat003/repos/.hatGit/bash/comet_cori_buffer.sh'
expected_buffer_num=10
buffer_dir='/global/homes/h/hat003/calculations/buffer/'
temp_dir='/global/homes/h/hat003/template/buffer_template_folder'

for nodes in 4 2 1
do
    # Number of jobs in queue
    queue_num=$(sqs | grep JobHeld | grep " $nodes " | wc -l)

    # If the queuing job number is less than the required, submit a new one
    if [ "$queue_num" -lt "$expected_buffer_num" ]; then
        # Get the maximun index and increase the index by one
        cd $buffer_dir
        cur_ind=$(ls -1 | sort -V | grep $nodes"_" | tail -1 | awk -F_ '{print $2}')
        index=$(($cur_ind+1))
        cp -r $temp_dir "$nodes"_"$index"
        sed -i "s/change_nodes/$nodes/" "$nodes"_"$index"/submit_script
        
        # Submission
        cd "$nodes"_"$index"
        job_id=$(sbatch submit_script | awk '{print $4}')
        scontrol hold $job_id
    fi

done
