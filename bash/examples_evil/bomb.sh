# Creative Destruction -- Fork Bomb
# Kill the SERVER without root, in 10 seconds.

#:(){ :|:& };:


# Solution
$ ulimit  # Show limit for users in Linux system.
unlimited
$ ulimit -a  # Show the manual.
core file size          (blocks, -c) 0
data seg size           (kbytes, -d) unlimited
file size               (blocks, -f) unlimited
max locked memory       (kbytes, -l) unlimited
max memory size         (kbytes, -m) unlimited
open files                      (-n) 4864
pipe size            (512 bytes, -p) 1
stack size              (kbytes, -s) 8192
cpu time               (seconds, -t) unlimited
max user processes              (-u) 709
virtual memory          (kbytes, -v) unlimited

$ ulimit -u 20  # Limit max user processes=20. But expires after terminal shuts down.
$ hanmeiTang - nproc 20  # /etc/security/limits.conf 
