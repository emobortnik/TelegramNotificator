#!/bin/bash


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




#echo "[telegram]
#token = Tocken
#chat_id = ID" > /etc/telegram-send.conf


telegram-send --configure --global-config

telegram-send --global-config

wget https://git.io/vbx3Z -O monitor.sh && chmod +x monitor.sh && rm -f install.sh
