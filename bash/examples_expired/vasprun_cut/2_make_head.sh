#!/bin/bash
cd /home/zhl383/NpT_NVT/1_Li3PS_123_Li_256/495/1/300

# get line number
for f in $(ls)
do
	echo $f
	#grep modeling $f/vasprun.xml
	echo -n "  the head: "
	begin=$(grep -n 'initialpos' $f/vasprun.xml | tail -1 | cut -d ':' -f 1)
	end=$(grep -n '\<structure\>' $f/vasprun.xml | head -2 | tail -1 | cut -d ':' -f 1)
	echo $begin $end
	
	sed  -n $begin,$end'p' $f/vasprun.xml > $f/head.xml
	sed -i 's/initialpos/finalpos/' $f/head.xml
	echo '</modeling>' >> $f/head.xml
	
	echo $f done!
	echo
done
