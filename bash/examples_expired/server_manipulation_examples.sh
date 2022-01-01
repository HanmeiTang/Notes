# This manually update database for locate 
$ sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# This will disable service
$ sudo launchctl unload  /System/Library/LaunchDaemons/ssh.plist

# This gives details of locate configurations, database is updated weekly.
$ vi /System/Library/LaunchDaemons/com.apple.locate.plist

# This is to add current key to remote server
# and no need to input key to server any more
$ d_rsa.pub |ssh hat003@mavrldata.ucsd.edu 'cat ->>~/.ssh/authorized_keys'

# Check system time
$ date
Fri Jun 24 17:14:39 PDT 2016

## Disable Mac Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean YES && killall Dock

## Re-enable Dashboard
defaults write com.apple.dashboard mcx-disabled -boolean NO && killall Dock

## Digit match example @COMET
for i in $(ls)
do 
  cd $i
  for j in $(ls)
  do  
    cd $j
    ## all scratch files start with '23'
    for k in $(echo $(ls ntpo.*) | grep -Eo "23[[:digit:]]+")
    do  
      cp /oasis/scratch/comet/hat003/temp_project/$k/* .
    done
    ls; cd ..
  done
  cd ..
done

# Find large file and gzip them
for i in CHGCAR CHG OUTCAR vasprun.xml DOSCAR PROCAR;do find . -name $i -exec gzip {} \;;done

# Find all large files and remove them
find . -name CHGCAR -exec rm {} \;

# Remove all files except target.file
for i in $(ls);do if [ $i == 'target.file' ]; then echo $i;fi;done
rm -- !(target.file)

# Find and rm all files
find . -iname *adobe* > ~/Desktop/rm_adobe.log
while read i;do echo $i;sudo rm -r "$i";done < ~/Desktop/rm_adobe.log

# Find multiple names and show total size:
find . -name  CHGCAR  -o -name POTCAR -exec du -shc {} + | tail -1 | awk '{print $1}'

# Solve the problem when Mac ask key of id_rsa.pub after installation
cd ~/.ssh
ssh-keygen -y -f id_rsa > id_rsa.pub
chmod 600 id_rsa*
ssh-add -K

# Useful cut command
for i in $(cat name.dat);do echo $i | cut -d '/' -f 6;done > names.data

# useful substitution
for i in {1..300};do a=$(sed -n "$i"p short_name.dat); b=$(sed -n "$i"p folder.dat);mv $b $a;done

# This is used to check how many valid lines in xmu.dat
# Expected num is 100 for every file.
for i in $(echo *.dat);do a=$(cat $i | wc -l);b=$(grep '#' $i|wc -l);c=$((($a-$b)));echo $c;done

