#!bin/bash
# Author :: Hanmei Tang
# Date :: Apr 12, 2020
# Tips:
# To generate a random number between [1, 10]
# i=$(((RANDOM%10+1)))


# Generate a random number in [0, 9] and log it
source $HOME/.bash_profile
n=$(((RANDOM%10)))
date >> $HOME/commit.log
echo Will push $n commits >> $HOME/commit.log

cd $HOME/repos/hatGit
git pull

for (( c=1; c<=$n; c++ ))
do
    date >> README.md
    git add README.md
    git commit -m "Rabbit Robot"
done
git push
