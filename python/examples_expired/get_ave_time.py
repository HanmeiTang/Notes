#!/global/common/cori/software/python/3.5-anaconda/bin/python

import re
import os
from glob import glob
from pymatgen.util.plotting import pretty_plot

path = os.path.abspath(".")
file = "OUTCAR"

pattern = re.compile(r'LOOP\+:\s+cpu time\s*[0-9.]+:\s*real time\s+([0-9.]+)')
with open(file) as outcar:
    runtime = pattern.findall(outcar.read())
    runtime = [float(i) for i in runtime]
    total_step = len(runtime)
    if len(runtime) > 5:
        # Skip the first 3 steps
        runtime = runtime[3:]
        ave = sum(runtime) / len(runtime)
        print("{} steps: {:.2f} s/step".format(total_step, ave))
    else:
        print("{} steps is not enough!".format(len(runtime)))
        if len(runtime) >= 1:
            ave = sum(runtime) / len(runtime)
            print("{} steps: {:.2f} s/step".format(total_step, ave))
        else:
            print("Less than one step!")
print("-------------\n")
