# Useful Mac only command

## Command basics
```bash
# force quit command
Command + C # command will continue running if simply close the window

# Find more about one command
$ whereis echo
/bin/echo
$ which echo
/bin/echo
$ whatis banner
banner(6)                - print large banner on printer
```

## The path variable
```bash
$ echo $PATH
/Users/hanmeiTang/repos/vtstscripts:/Users/hanmeiTang/repos/pymatgen/cmd_line/enum/Darwin_64bit:/usr/local/gnuplot-5.0.3:/usr/local/octave/3.8.0/bin:/Users/hanmeiTang/miniconda3/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin
```

## System information command
```bash
$ date # Show system date time 
Tue Nov 29 01:07:01 PST 2016

$ uptime # Show linux login duration and system performance
10:33  up  1:33, 2 users, load averages: 2.04 1.81 1.81

$ whoami or $ users # Find username
hanmeiTang

$ who # Show login users, from Finder + Terminal, no wonder
hanmeiTang console  Nov 29 09:00  # Finder
hanmeiTang ttys000  Nov 29 10:33  # Terminal

[Mac] ~ $ uname # Unix name
Darwin # Version of Unix that OSX is running on
[TSCC] ~/ $ uname
Linux # Version of Unix that TSCC is running on

[Mac] ~ $ uname -ap # Version info with all (-a) processor (-p)
Darwin hanmeis-mbp.dynamic.ucsd.edu 16.1.0 Darwin Kernel Version 16.1.0: Thu Oct 13 21:26:57 PDT 2016; root:xnu-3789.21.3~60/RELEASE_X86_64 x86_64 i386
[Mac] ~ $ hostname
hanmeis-mbp.dynamic.ucsd.edu
[Mac] ~ $ domainname # Not set, will be help if working with web

[TSCC] ~/ $ uname -ap
Linux tscc-login2.sdsc.edu 2.6.32-642.6.1.el6.x86_64 #1 SMP Wed Oct 5 00:36:12 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
[TSCC] ~/ $ hostname
tscc-login2.sdsc.edu
[TSCC] ~/ $ domainname
(none)
```

## Disk info command
```bash
[Mac] ~ $ df # Display free space
Filesystem    512-blocks      Used Available Capacity iused      ifree %iused  Mounted on
/dev/disk1     487849984 289643024 197694960    60% 2588036 4292379243    0%   /
devfs                363       363         0   100%     628          0  100%   /dev
map -hosts             0         0         0   100%       0          0  100%   /net
map auto_home          0         0         0   100%       0          0  100%   /home

[Mac] ~ $ df -h # Display with human readable format (-h) base-2, recommended
Filesystem      Size   Used  Avail Capacity iused      ifree %iused  Mounted on
/dev/disk1     233Gi  138Gi   94Gi    60% 2588037 4292379242    0%   /
devfs          182Ki  182Ki    0Bi   100%     628          0  100%   /dev
map -hosts       0Bi    0Bi    0Bi   100%       0          0  100%   /net
map auto_home    0Bi    0Bi    0Bi   100%       0          0  100%   /home

[Mac] ~ $ df -H # Display with human readable format (-h) base-10
Filesystem      Size   Used  Avail Capacity iused      ifree %iused  Mounted on
/dev/disk1      250G   148G   101G    60% 2588053 4292379226    0%   /
devfs           186k   186k     0B   100%     628          0  100%   /dev
map -hosts        0B     0B     0B   100%       0          0  100%   /net
map auto_home     0B     0B     0B   100%       0          0  100%   /home

[Mac] ~ $ du -h # Display usage, no directory given, will show everything
4.0K	./.android
.... # Hit Control+C to quit command

[Mac] 1 $ du -h . # Display usage for current directory
 24K	./haha
 48K	.
 
[Mac] 1 $ du -ah . # Display all (-a) usage for current directory
 24K	./fi
 24K	./haha/fi
 24K	./haha
  0B	./ownership.txt
 48K	.

[Mac] temp_job $ du -hd 1 . # Display with depth = 1
172K	./.ipynb_checkpoints
 48K	./1
 24K	./2
 99M	./4_neb
100M	.

[Mac] temp_job $ du -hd 0 .
100M	.
# One issue here
# You may find the folder size is different from $ ls -lah
# $ du returns the space taken up by the block
# And so far it is only file size not directory size!!!

$ ls -lah 10_nvpo_ehull.ipynb # Actual size
-rwxr-xr-x  1 hanmeiTang  staff   159K Nov 18 11:22 10_nvpo_ehull.ipynb

$ du -h 10_nvpo_ehull.ipynb # Allocation size
160K	10_nvpo_ehull.ipynb
```

## Viewing processes
```bash
$ ps # Process (owned by me)
  PID TTY           TIME CMD
 1420 ttys000    0:00.28 -bash
 1629 ttys001    0:00.03 -bash
 1649 ttys001    0:00.08 ssh hat003@tscc.sdsc.edu
 
$ ps -a # Process (owned by all users)
  PID TTY           TIME CMD
 1415 ttys000    0:00.04 login -pf hanmeiTang
 1420 ttys000    0:00.28 -bash
 2505 ttys000    0:00.00 ps -a
 1628 ttys001    0:00.02 login -pf hanmeiTang
 1629 ttys001    0:00.03 -bash
 1649 ttys001    0:00.08 ssh hat003@tscc.sdsc.edu

$ ps aux # Process (a: owned by all users; u: show username; x: show background process)
# PID = process_id; %CPU = cpu_used; %MEM = memory_used; VSZ = Virtual_memory_used; TT = terminal; STAT = status; STARTED = started_time; TIME = running_time; COMMAND = command_used
USER               PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND
root                54  25.7  3.3  5137432 274476   ??  SNs   9:00AM   2:25.79 /Applications/CrashPlan.app/Contents/MacOS/CrashPlanService -Dapp=CrashPlanService -Xmn10m -Xm
hanmeiTang         346   6.5  0.2  2507476  15060   ??  S     9:00AM   0:18.16 /System/Library/PrivateFrameworks/CacheDelete.framework/deleted
hanmeiTang        1176   4.9  1.8  2784384 154004   ??  S    10:17AM   0:33.37 /Applications/Utilities/System Information.app/Contents/MacOS/System Information
root              2540   0.0  0.0  2442404   2348 s000  R+   11:36AM   0:00.00 ps aux  # s000 is my terminal
root               110   0.0  0.1  2469936   6568   ??  Ss    9:00AM   0:00.02 autofsd # ?? is usually launched by Mac
```

## Monitoring process
```bash
# The problem we got is ps shows only the processes snapshot
# What if we want to monitoring realtime processes
$ top

$ top -n 10 # Show the top 10 processes

$ top -n 10 -o cpu -U hanmeiTang -s 3
# -n 10: top 10; -o cpu: ordered by cpu; -U hanmeiTang: user specified; -s 3: refreshed every 3 sec
Processes: 329 total, 2 running, 327 sleeping, 1591 threads                                                                                                          11:54:47
Load Avg: 1.60, 1.67, 1.67  CPU usage: 6.94% user, 4.79% sys, 88.25% idle  SharedLibs: 155M resident, 39M data, 42M linkedit.
MemRegions: 48155 total, 2658M resident, 98M private, 698M shared. PhysMem: 7871M used (2005M wired), 319M unused.
VM: 885G vsize, 614M framework vsize, 30160(0) swapins, 61886(0) swapouts. Networks: packets: 814315/306M in, 96795/29M out. Disks: 364867/8925M read, 118002/5443M written.
PID   COMMAND      %CPU TIME     #TH  #WQ  #POR MEM    PURG   CMPRS PGRP PPID STATE    BOOSTS       %CPU_ME %CPU_OTHRS UID  FAULTS   COW    MSGSENT  MSGRECV SYSBSD   SYSMACH
308   Terminal     20.1 01:06.19 9    4    319  59M    16K    11M   308  1    sleeping *0[737+]     0.00131 1.63104    501  548939+  1590   306608+  72273+  610883+  814798+
302   Evernote     0.5  03:23.22 20   4    440  192M-  952K   42M   302  1    sleeping *2[3]        0.00087 0.00000    501  1159327  2454   857359+  153118+ 1267661+ 2041576+
566   Dropbox      0.4  01:15.58 131  1    456  59M    12K    110M  566  1    sleeping *2[3]        0.00000 0.00000    501  361856+  32315  84347+   15468   2521506+ 282468+
880   Google Chrom 0.3  00:40.74 16   2    132  166M+  0B     66M   295  295  sleeping *0[2]        0.00000 0.00000    501  312502+  1717   24431+   9311+   229034+  410410+
388   Google Chrom 0.2  01:34.92 9    2    192  95M    9328K  19M   295  295  sleeping *0[1]        0.00000 0.00000    501  510884   1673   808585   309970  1966915+ 2877585
2435  Google Chrom 0.2  00:13.92 14   2    134  212M+  8192B  12K   295  295  sleeping *0[2]        0.00000 0.00000    501  155282+  1701   10377+   6537+   65200+   413250+
508   icdd         0.1  00:01.23 3    2    63   2580K  0B     3200K 508  1    sleeping *0[1]        0.00000 0.00000    501  8305     203    2866+    1747+   25226+   8687+
1101  Google Chrom 0.1  00:20.19 12   1    133  128M+  0B     23M   295  295  sleeping *0[2]        0.00000 0.00000    501  181080+  1676   16385+   7779+   122359+  515762+
295   Google Chrom 0.1  04:15.14 42   1    666  151M   1328K  59M   295  1    sleeping *0[856]      0.00000 0.00000    501  2264725+ 145788 1364186+ 409666  6120237+ 7600545+
878   Google Chrom 0.1  03:46.20 22   2    176  124M   0B     41M   295  295  sleeping *0[2]        0.00000 0.00000    501  516056   1694   572676+  91423+  2527562+ 4793234+
```

```bash
q # Quit
? # Help
State    Command        Description
          ?              Display this help screen.
n         c<mode>        Set event counting mode to {a|d|e|n}.
pid       o<key>         Set primary sort key to <key>: [+-]keyname.
                         Keyname may be:{pid|command|cpu|csw|time|threads|
                         ports|mregion|rprvt|rshrd|rsize|vsize|vprvt|pgrp|
                         ppid|state|uid|wq|faults|cow|user|msgsent|msgrecv|
                         sysbsd|sysmach|pageins}.
pid       O<skey>        Set secondary sort key to <skey> (see o<key>).
          q              Quit top.
          S<sig>\n<pid>  Send signal <sig> to pid <pid>.
1         s<delay>       Set the delay between updates to <delay> seconds.
off       r              Toggle the memory map reporting.
          U<user>        Only display processes owned by <user>, or all.
[Type s to set delay]
update interval[1]: 7 [Hit enter]
```

## Stop processes
```bash
# Let's try open a new terminal window and kill the process
$ who # Now I have two terminals running and I gonna kill one
hanmeiTang console  Nov 29 09:00 
hanmeiTang ttys000  Nov 29 10:33 
hanmeiTang ttys001  Nov 29 12:16 

$ ps aux
hanmeiTang        3115   0.0  0.0  2461044   3604 s001  S+   12:16PM   0:00.04 -bash

$ kill 3115 # Kill the process

$ ps aux | grep 3115 # WTF I can still find this
hanmeiTang        3115  0.0  0.0  2461044   3604 s001  S+   12:16PM   0:00.04 -bash
# Mac: Well, I know what you mean but I thought twice and denied your request.
# Then I need to tell Mac, I know better than you, just kill it.

$ kill -9 3115 # Succeed this time. But please be careful, first try $ kill
```

## Text file helper
```bash
# wc = word count
$ wc INCAR # 28 lines, 84 words, 335 characters
      28      84     335 INCAR

# sort doesn't change original file!
$ sort KPOINTS # This will be more useful for INCAR!
0
2 2 1
Gamma
pymatgen generated KPOINTS with grid density = 958 / atom

$ sort -r KPOINTS # sort reverse
pymatgen generated KPOINTS with grid density = 958 / atom
Gamma
2 2 1
0

$ sort INCAR 
ALGO = Fast
EDIFF = 5e-05
EDIFFG = -0.05
ENCUT = 520
ENCUT = 520 # replica
SIGMA = 0.05
SPRING = -5

$ sort -u INCAR # sort and return unique lines
ALGO = Fast
EDIFF = 5e-05
EDIFFG = -0.05
ENCUT = 520
SIGMA = 0.05
SPRING = -5

# uniq only compares neighbouring lines, -d = duplicated
$ uniq -d INCAR 

# so you need to sort first
$ sort INCAR | uniq -d
ISMEAR = 0
LCHARG = False

# -u = unduplicated
$ sort INCAR | uniq -u
ALGO = Fast
EDIFF = 5e-05
EDIFFG = -0.05
ENCUT = 520
IBRION = 3
ICHAIN = 0
ICHARG = 1
...
```

## Utility programs
```bash
$ cal # calendar
   November 2016
Su Mo Tu We Th Fr Sa
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 17 18 19
20 21 22 23 24 25 26
27 28 29 30

$ cal 11 2017
   November 2017
Su Mo Tu We Th Fr Sa
          1  2  3  4
 5  6  7  8  9 10 11
12 13 14 15 16 17 18
19 20 21 22 23 24 25
26 27 28 29 30

$ cal -y 2017 # full year calendar
                             2017
      January               February               March
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4            1  2  3  4
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   5  6  7  8  9 10 11
15 16 17 18 19 20 21  12 13 14 15 16 17 18  12 13 14 15 16 17 18
22 23 24 25 26 27 28  19 20 21 22 23 24 25  19 20 21 22 23 24 25
29 30 31              26 27 28              26 27 28 29 30 31
                                            
       April                  May                   June
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1      1  2  3  4  5  6               1  2  3
 2  3  4  5  6  7  8   7  8  9 10 11 12 13   4  5  6  7  8  9 10
 9 10 11 12 13 14 15  14 15 16 17 18 19 20  11 12 13 14 15 16 17
16 17 18 19 20 21 22  21 22 23 24 25 26 27  18 19 20 21 22 23 24
23 24 25 26 27 28 29  28 29 30 31           25 26 27 28 29 30
30                                          
        July                 August              September
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
                   1         1  2  3  4  5                  1  2
 2  3  4  5  6  7  8   6  7  8  9 10 11 12   3  4  5  6  7  8  9
 9 10 11 12 13 14 15  13 14 15 16 17 18 19  10 11 12 13 14 15 16
16 17 18 19 20 21 22  20 21 22 23 24 25 26  17 18 19 20 21 22 23
23 24 25 26 27 28 29  27 28 29 30 31        24 25 26 27 28 29 30
30 31                                       
      October               November              December
Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa
 1  2  3  4  5  6  7            1  2  3  4                  1  2
 8  9 10 11 12 13 14   5  6  7  8  9 10 11   3  4  5  6  7  8  9
15 16 17 18 19 20 21  12 13 14 15 16 17 18  10 11 12 13 14 15 16
22 23 24 25 26 27 28  19 20 21 22 23 24 25  17 18 19 20 21 22 23
29 30 31              26 27 28 29 30        24 25 26 27 28 29 30
                                            31
$ ncal # normal calendar? hahha
    November 2016
Mo     7 14 21 28
Tu  1  8 15 22 29
We  2  9 16 23 30
Th  3 10 17 24
Fr  4 11 18 25
Sa  5 12 19 26
Su  6 13 20 27

$ bc # I don't want to learn this.... this is bench calculator
bc 1.06
Copyright 1991-1994, 1997, 1998, 2000 Free Software Foundation, Inc.
This is free software with ABSOLUTELY NO WARRANTY.
For details type `warranty'. 

$ units # Interesting........
586 units, 56 prefixes
You have: 56 feet
You want: meter
 	* 17.0688
 	/ 0.058586427
  
$ units "2 liters" "quarts"
 	* 2.1133764
 	/ 0.47317647
```

## Using the command history
![Using the command history](https://github.com/HanmeiTang/Notes/blob/main/bash/history.png)
```bash
$ vi ~/.bash_history  # History record?

$ history # the 139 is reference number, use $ !139 to run this command again
  139  open .
...

# Edited history item is marked with '*', even it was not executed.
....
  641  ls
  642* historyd
  643  history
  
$ !139 # run _id = 139
open .

$ !-5 # run last 5th command
open .

$ !ca # Match the most recent command started with 'ca' and run
cal -y 2017
...

$ !! # same with $ !-1

$ ls 08
OUTCAR POSCAR

$ ls !$ # use the latest argument
ls 08
OUTCAR POSCAR
```

## Reference (11/29/2016)
* I only recorded those I don't know from [Unix MacOS X](https://www.lynda.com/Mac-OS-tutorials/Unix-Mac-OS-X-Users/78546-2.html)

