#!/bin/bash
# This code is dangerous! Backup data before running.
cd /home/zhl383/NpT_NVT/1_Li3PS_123_Li_256/495/1/300

# get line number
for f in $(cat /home/zhl383/NpT_NVT/1_Li3PS_123_Li_256/unfinished_hat)
do
	echo $f
	#grep modeling $f/vasprun.xml
	echo -n "  the tail: "
	cal=$(grep -n '\<calculation\>' $f/vasprun.xml | tail -1 | cut -d ':' -f 1)
	end=$(cat $f/vasprun.xml|wc -l)
	echo $cal $end
	# Danger: cut tail!
	sed -i $cal,$end'd' $f/vasprun.xml
	echo $f done!
	echo
done
