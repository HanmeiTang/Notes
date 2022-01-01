#!/bin/bash
cd ~/.ssh
ssh-keygen -y -f id_rsa > id_rsa.pub
chmod 600 id_rsa*
ssh-add -K
