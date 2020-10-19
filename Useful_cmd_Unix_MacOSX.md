## Show version
```BASH
$ ruby --version
ruby 2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin15]
# Or
$ ruby -v
ruby 2.0.0p648 (2015-12-16 revision 53162) [universal.x86_64-darwin15]
```

## Get help
```bash
# Show entire manual
$ man man
# Show quick options references
$ man --help
# Or
$ man -h
```

## Show banner
```bash
# Very interesting command, 'w' flag refers to width, give it a try
$ banner -w 500 'Hanmei'
```

## Echo tag
```bash
# `-n` cancels next line
$ echo -n 'Hello'; echo 'world'
Helloworld
```

## Shell
```bash
# You don't need to move to other SHELL.
# This just gives you a sense that you are 'in' bash shell.
$ echo $SHELL
/bin/bash
[Mac] ~/ $ echo $0
-bash
[Mac] ~/ $ tcsh
[Hanmeis-MacBook-Pro:~] hanmeiTang%  echo $SHELL
/bin/bash
[Hanmeis-MacBook-Pro:~] hanmeiTang% echo $0
tcsh
```

## Command apropos & whatis
```bash
# Find similar command
$ man -k banner
banner(6)                - print large banner on printer
$ apropos banner
banner(6)                - print large banner on printer
$ apropos ban
Moose::Cookbook::Basics::BankAccount_MethodModifiersAndSubclassing(3pm) - Demonstrates the use of method modifiers in a subclass
banner(6)                - print large banner on printer
dummynet(4)              - traffic shaper, bandwidth manager and delay emulator
ldap_abandon_ext(3)      - Abandon an LDAP operation in progress
# Is there a 'what'?
$ whatis banner
banner(6)                - print large banner on printer
$ whatis ban
ban: nothing appropriate
```

## Reading files
```bash
# tail and head
$ tail -f somfile # this shows file online, for example some log file
                  # -f = follow
                  # ^C to exit
```

## Working with files
```bash
# build directory structure
$ mkdir -p 1st/2nd/3rd
```

## Hard link and Symbolic link
```bash
# Tip: Don't make too many alias file or folders because it takes much more space to track file
# alias is used by finder, not readable by command
# Link in linux = ln
$ ln somfile  hardlink # default is hard link, which keeps track with original file and update
$ ll                   # even the file is renamed, move to another position or deleted!
total 32
drwxr-xr-x  7 hanmeiTang  staff   238B Jul 12 19:59 .
drwxr-xr-x  3 hanmeiTang  staff   102B Jul 12 19:44 ..
-rw-r--r--  2 hanmeiTang  staff   761B Jul 12 19:24 hardlink
-rw-r--r--  1 hanmeiTang  staff    23B Jul 12 19:52 linked_file
-rw-r--r--  1 hanmeiTang  staff   1.5K Jul 12 19:25 newfile
drwxr-xr-x  3 hanmeiTang  staff   102B Jul 12 19:40 next_floder
-rw-r--r--  2 hanmeiTang  staff   761B Jul 12 19:24 somfile

# hard link keeps data even original file is not there
$ find . -samefile newfile  
./hardlink
./newfile

$ ln -s newfile symlink # -s = sym link
$ ln -s /oasis/tscc/scratch/hat003/hanmei_storage hatBase

# rm hatBase/ doesn't work!
$ rm hatBase 

# sym link is weak, rename or move file will destroy the link. But you can recover it if you move everything back.
$ ll 
total 40
drwxr-xr-x  8 hanmeiTang  staff   272B Jul 12 20:28 .
drwxr-xr-x  3 hanmeiTang  staff   102B Jul 12 19:44 ..
-rw-r--r--  2 hanmeiTang  staff   1.5K Jul 12 20:01 hardlink
-rw-r--r--  1 hanmeiTang  staff    23B Jul 12 19:52 linked_file
-rw-r--r--  2 hanmeiTang  staff   1.5K Jul 12 20:01 newfile
drwxr-xr-x  3 hanmeiTang  staff   102B Jul 12 19:40 next_floder
-rw-r--r--  1 hanmeiTang  staff   761B Jul 12 19:24 somfile
lrwxr-xr-x  1 hanmeiTang  staff     7B Jul 12 20:28 symlink -> newfile
```

## Search files and directories
```bash
# find path expression
$ find ~/repos/ -name "symlink"
/Users/hanmeiTang/repos//hatGit/osx_ex/this_folder/symlink
$ find ~/repos/ -name "symli?" # wild card, in this case, no match
$ find ~/repos/ -name "symli??"# wild card find one match
/Users/hanmeiTang/repos//hatGit/osx_ex/this_folder/symlink
$ find ~/repos/ -name "symli*"
/Users/hanmeiTang/repos//hatGit/osx_ex/this_folder/symlink

$ find ~/repos/hatGit/ -name "*.py" # too many results, for example
/Users/hanmeiTang/repos/hatGit//lib/example.py
/Users/hanmeiTang/repos/hatGit//lib/io/creator.py
/Users/hanmeiTang/repos/hatGit//lib/md/md_launch.py
/Users/hanmeiTang/repos/hatGit//lib/md/md_update.py
/Users/hanmeiTang/repos/hatGit//lib/neb/cifpath.py
/Users/hanmeiTang/repos/hatGit//lib/neb/cifpath_forshow.py
/Users/hanmeiTang/repos/hatGit//lib/neb/diff_abc.py
/Users/hanmeiTang/repos/hatGit//xxx_stash/analysis/bottleneck.py
/Users/hanmeiTang/repos/hatGit//xxx_stash/analysis/test/__init__.py
/Users/hanmeiTang/repos/hatGit//xxx_stash/analysis/test/test_bottleneck.py
/Users/hanmeiTang/repos/hatGit//xxx_stash/analysis/test/test_chg_val.py
/Users/hanmeiTang/repos/hatGit//xxx_stash/bim/workfunction.py

$ find ~/repos/hatGit/ -name "*.py" -and -not -path *xxx*# "xxx" is excluded from directory name
/Users/hanmeiTang/repos/hatGit//lib/example.py
/Users/hanmeiTang/repos/hatGit//lib/io/creator.py
/Users/hanmeiTang/repos/hatGit//lib/md/md_launch.py
/Users/hanmeiTang/repos/hatGit//lib/md/md_update.py
/Users/hanmeiTang/repos/hatGit//lib/neb/cifpath.py
/Users/hanmeiTang/repos/hatGit//lib/neb/cifpath_forshow.py
/Users/hanmeiTang/repos/hatGit//lib/neb/diff_abc.py
```

## Reference
* I only recorded those I don't know from [Unix MacOS X](https://www.lynda.com/Mac-OS-tutorials/Unix-Mac-OS-X-Users/78546-2.html)
