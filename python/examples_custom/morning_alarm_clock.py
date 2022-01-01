#!/Users/hanmeitang/miniconda3/bin/python

import os
import logging
from random import choice
import webbrowser
from pyhatlib.util.log_util import get_logger

logger = get_logger(__name__, level=logging.INFO,
                    filename=os.path.join(os.environ["HOME"], "morning.log"))

play_dict = {
    "https://www.youtube.com/watch?v"
    "=WI3OQQ1JkXw&list=PLJj06SbMAVqMM-YJ"
    "sIwH5bJdZCoaSR5gB&index=2&t=8s": "recipe_list",

    "https://www.youtube.com/watch?v=OsnyG9Mp6Zo&l"
    "ist=PLJj06SbMAVqMM-YJsIwH5bJdZCoaSR5gB&in"
    "dex=6": "Kuromame -simmered black beans",

    "https://www.youtube.com/w"
    "atch?v=klYnA64l4dQ&list=PLJj06SbMAVqMM-"
    "YJsIwH5bJdZCoaSR5gB&index=9": "Black Rice Pudding",

    "https://www.youtube.com/watch?v=J0"
    "jgpUIbMEo&list=PLJj06SbMAVqMM-YJsIwH5"
    "bJdZCoaSR5gB&index=14": "Homemade Nut Butter",

    "https://www.youtube.com/watch?v=a"
    "FRYxC6Rd8U&list=PLJj06SbMAVqMM-YJsIwH5b"
    "JdZCoaSR5gB&index=15": "Sakura Anpan",

    "https://www.youtube.com/watch?v=QIkHH"
    "bvGqi0&list=PLJj06SbMAVqMM-YJsIwH5bJd"
    "ZCoaSR5gB&index=20": "Lemon Curd Tart",

    "https://www.youtube.com/watch?v=p"
    "OIMrYmngiM&list=PLJj06SbMAVqMM-YJ"
    "sIwH5bJdZCoaSR5gB&index=31": "Pecan Pie",

    "https://www.youtube.com/watch?v=UP"
    "0jYMLfAtY&list=PLJj06SbMAVqMM-YJsI"
    "wH5bJdZCoaSR5gB&index=27": "Pad Thai",

    "https://www.youtube.com/watch?v=FVh1"
    "nt9IhEk&list=PLJj06SbMAVqMM-YJsIw"
    "H5bJdZCoaSR5gB&index=35": "Potato Gnocchi",
    "https://www.youtube.com/watch?v=PIEl96dd_4U&list=RDZAFtP4RF5Ig&index=2": "BGM flowing in the shop of MUJI"
}

play_list = list(play_dict.keys())
video = choice(play_list)

webbrowser.open(video)
logger.info("Good morning! {} is waiting for you~".format(play_dict[video]))
