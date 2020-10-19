# Ownership and permission

## Who am I?
```bash
# find path expression
$ whoami # show the login user
hanmeiTang
[TSCC] ~/ $ whoami
hat003
$ echo $HOME # show your home directory
/Users/hanmeiTang
$ groups # show unix groups that you are belong to, this actually shows permission
staff everyone localaccounts _appserverusr admin _appserveradm _lpadmin com.apple.sharepoint.group.1 _appstore _lpoperator _developer com.apple.access_ftp com.apple.access_screensharing com.apple.access_ssh
```

## Unix Groups
```bash
[TSCC] ~/ $ groups # this is clear on tscc!
ong-group gaussian-users vasp-users csd450
[TSCC] mix/ $ ls -la # Now you know 'hat003' is login user and 'ong-group' is unix group with permission
total 17
drwxr-xr-x  5 hat003 ong-group  5 Jun 19 15:27 .
drwxr-xr-x 24 hat003 ong-group 40 Jul 11 10:21 ..
drwxr-xr-x  5 hat003 ong-group 13 Jun 19 15:27 1_enu_snti
drwxr-xr-x  4 hat003 ong-group  4 Jun 19 15:26 2_neb
drwxr-xr-x  4 hat003 ong-group  4 Jun 18 16:03 3_bader

[TSCC] projects/ $ ls -la # User with different permission, 'root', 'ong-group', etc.
total 83
drwxr-xr-x 12 root      root               0 Nov 28 22:00 .
drwxr-xr-x 31 root      root            4096 Nov 10 11:30 ..
drwxrwxr-x  7 sselvaraj arima-group        7 Aug 31 12:55 arima
drwxrwx--- 16 root      mgilson-group   4096 Oct 25 08:40 gilson-gpfs
drwxrwx--- 10 shyuep    matqm-group       10 Nov  7 06:50 matqm
drwxr-xr-x 37 nfsnobody nfsnobody       4096 Nov 28 13:31 nhenriksen
drwxrwx--- 18 ongsp     ong-group         20 Nov 11 08:10 ong-group
drwxrwxr-x 92 escott    jogleeson-group  121 Nov 15 11:59 ps-gleesonlab
drwxrwxr-x 29 root      jogleeson-group   32 Nov 28 14:51 ps-gleesonlab3
drwxrwxr-x 18 aschitre  palmer-group      18 Oct 26 11:31 ps-palmer
drwxrwsr-x 67 yeo-lab   yeo-group         72 Nov 27 14:52 ps-yeolab
drwxrwx--- 18 gpratt    yeo-group         18 Nov 23 10:47 ps-yeolab3
```

## File and directory ownership
```bash
# chown [ownership] filename = change ownership
# ls with a long format -l
$ ls -l
-rw-r--r--  1 hanmeiTang  staff      0 Nov 28 22:48 ownership.txt
# change ownership from hanmeiTang to root
$ sudo chown root:staff ownership.txt 
Password: 
$ ls -l
-rw-r--r--  1 root        staff      0 Nov 28 22:48 ownership.txt
$ chown :everyone ownership.txt 
$ ls -l
-rw-r--r--  1 root        everyone      0 Nov 28 22:48 ownership.txt
# change ownership for directory
$ ls -l
drwxr-xr-x  3 hanmeiTang  staff       102 Nov 28 22:56 haha
$ chown -R hanmeiTang:everyone haha/
$ ls -l
drwxr-xr-x  3 hanmeiTang  everyone    102 Nov 28 22:56 haha
```

## File and directory permission
`chmod [permission] filename: change mode (permission)`

## Setting permission using alpha notation
```bash
# file permissions: alpha notation
------------------------------------------------- 
#             |  user (u)     group (g)    other (o)
# read (r)    |    Y             Y            Y
# write (w)   |    Y             Y            N
# execute (x) |    Y             N            N
------------------------------------------------- 
              |   rwx            rw-          r--
------------------------------------------------- 
# Protect COMET files
[COMET] home/ $ ls -la | grep hat003
dr-xr--r--  21 hat003    vasp-users       36 Nov 28 23:29 hat003
[COMET] home/ $ chmod u=rwx,go-r hat003 # user = read, write, execute
                                        # group, others - read
[COMET] home/ $ ls -la | grep hat003
drwx------  21 hat003    vasp-users       36 Nov 28 23:29 hat003
# Protect TSCC files
[TSCC] home/ $ chmod u=rwx,go-r hat003/
[TSCC] home/ $ ls -la | grep hat003
drwx------  28 hat003      ong-group             46 Nov 28 23:28 hat003
# Protect TSCC oasis files
[TSCC] scratch/ $ chmod u=rwx,go-rwx hat003
[TSCC] scratch/ $ ls -la | grep hat003
drwx------ 1391 hat003          ong-group              287232 Nov 28 16:32 hat003
```

## Setting permission using octal notation
```bash
# alpha notation --conversion--> octal notation
# r = 4, w = 2, x = 1
------------------------------------------------- 
#             |  user (u)     group (g)    other (o)
# read (r)    |    4             4            4
# write (w)   |    2             2            0
# execute (x) |    1             0            0
------------------------------------------------- 
              |    7             6            4
------------------------------------------------- 
# Protect COMET oasis files, irrelevant files are omitted
[COMET] hat003/ $ ls -la 
drwxr-xr-x   171 hat003 vasp-users   90624 Nov 10 11:05 temp_project
[COMET] hat003/ $ chmod 777 temp_project/
[COMET] hat003/ $ ls -la 
drwxrwxrwx   171 hat003 vasp-users   90624 Nov 10 11:05 temp_project
[COMET] hat003/ $ chmod 700 temp_project/
[COMET] hat003/ $ ls -la 
drwx------   171 hat003 vasp-users   90624 Nov 10 11:05 temp_project
# Set permission to default
[TSCC] home/ $ chmod 755 hat003
[TSCC] home/ $ ls -la| grep hat003
drwxr-xr-x  28 hat003        ong-group             46 Nov 28 23:28 hat003
```

## The root user
```bash
# Use root user permission, usually 5 min
$ sudo ls -la
Password:
# Disable root user permission right now
$ sudo -k
```

## sudo and sudoers
```bash
# You can be other users
[Mac] ~ $ sudo whoami
root
[Mac] ~ $ sudo -u hanmeiTang whoami
hanmeiTang
# See privilege file
# When register as admin, same privilege as root
[Mac] ~ $ sudo cat /etc/sudoers
...
##
## User privilege specification
##
root ALL=(ALL) ALL
%admin  ALL=(ALL) ALL
...
```

## Reference (11/28/2016)
* I only recorded those I don't know from [Unix MacOS X](https://www.lynda.com/Mac-OS-tutorials/Unix-Mac-OS-X-Users/78546-2.html)

