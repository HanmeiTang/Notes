#! /Users/hanmeiTang/miniconda3/bin/python
import pytz
from datetime import datetime
from sys import exit, argv
from research.cat.weight_tracker import WeightTracker

"""This is an exe used in Alfred to record Zombie's weight."""

# Help info
if '-h' in argv or "--help" in argv:
    info = "Usage:\n\n" \
           "To get help information:\n" \
           "   >>> record_zombie_weight.py --h\n" \
           "   >>> record_zombie_weight.py --help\n\n" \
           "To plot all data:\n" \
           "   >>> record_zombie_weight.py plot\n\n" \
           "To update Zombie's weight for one day:\n" \
           "   >>> record_zombie_weight.py 13 lbs 2018-10-19\n" \
           "   >>> record_zombie_weight.py 13 lbs\n" \
           "   >>> record_zombie_weight.py 13 kg\n" \
           "   >>> record_zombie_weight.py 13\n"  # 13 kg today

    print(info)
    exit(0)

wt = WeightTracker()

# Plot all data
if "plot" in argv:
    wt.pretty_plot_for_zombie()
    exit(0)

else:

    if len(argv) == 4:
        weight, unit, date = argv[1], argv[2], argv[3]

    elif len(argv) in [2, 3]:
        timezone = pytz.timezone("America/Los_Angeles")
        d_pst = timezone.localize(datetime.now())
        date = str(d_pst)
        if len(argv) == 2:  # record_zombie_weight.py 13
            weight, unit = argv[1], "kg"
        else:  # record_zombie_weight.py 13 kg
            weight, unit = argv[1], argv[2]
    else:
        raise ValueError("Wrong input arguments!")

    wt.update_record(date, float(weight), unit, overwrite=True)
    exit(0)
