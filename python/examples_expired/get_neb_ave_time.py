#!/global/common/cori/software/python/3.5-anaconda/bin/python

import re
import os
from glob import glob
from pymatgen.util.plotting import pretty_plot

all_steps = []
path = os.path.abspath(".")
for file in glob(path + "/[0-1][0-9]/OUTCAR"):
    host = file.split("/")[-3]
    image = file.split("/")[-2]
    
    pattern = re.compile(r'LOOP\+:\s+cpu time\s*[0-9.]+:\s*real time\s+([0-9.]+)')
    with open(file) as outcar:
        runtime = pattern.findall(outcar.read())
        runtime = [float(i) for i in runtime]
        total_step = len(runtime)
        if len(runtime) > 5:
            # Skip the first 3 steps
            runtime = runtime[3:]
            all_steps.extend(runtime)
        else:
            print("{}/{}: {} steps is not enough!".format(host, image, len(runtime)))
            continue

        ave = sum(runtime) / len(runtime)
        print("{}/{} ({} steps): {:.2f} s/step".format(host, image, total_step, ave))

ave_time = sum(all_steps) / len(all_steps)        
print("{} summary: {:.2f} s/step".format(host, ave_time))  
print("-------------\n") 
