#!/bin/bash

file=/home/somefile.txt
filemd5=`md5sum $file | cut -d " " -f1`
fingerprintfile=/home/md5sum


#тут проверка или есть питон установлен


sudo apt-get update
sudo apt-get install software-properties-common python-software-properties curl wget htop -y
sudo add-apt-repository ppa:jonathonf/python-3.6 -y
sudo apt-get update
sudo apt-get install python3.6 git -y


sudo apt-get install python3-pip -y 

curl -O https://bootstrap.pypa.io/get-pip.py
/usr/bin/python3.5m get-pip.py

sudo pip3 install telegram-send




echo "[telegram]
token = 507819298:AAHxRYpEk9S8SW4mk7KlBkj5Cp739Sr_aR0
chat_id = 87411862" > /etc/telegram-send.conf


#telegram-send --configure --global-config
