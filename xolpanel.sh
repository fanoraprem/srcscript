#!/bin/bash

#install
apt update && apt upgrade
apt install python3 python3-pip git
git clone https://github.com/fanoraprem/simplepanel.git
unzip simplepanel/FANORACHANNEL.zip
pip3 install -r FANORACHANNEL/requirements.txt
pip3 install pillow

#isi data
echo ""
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
read -e -p "[*] Input Your Domain :" domain
echo -e BOT_TOKEN='"'$bottoken'"' >> /root/FANORACHANNEL/var.txt
echo -e ADMIN='"'$admin'"' >> /root/FANORACHANNEL/var.txt
echo -e DOMAIN='"'$domain'"' >> /root/FANORACHANNEL/var.txt
clear
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "DOMAIN         : $bottoken"
echo "Email          : $admin"
echo "Api Key        : $domain"
echo -e "==============================="
echo "Setting done"

cat > /etc/systemd/system/FANORACHANNEL.service << END
[Unit]
Description=Simple FANORACHANNEL - @FANORACHANNEL
After=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/python3 -m FANORACHANNEL
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start FANORACHANNEL 
systemctl enable FANORACHANNEL

clear

echo " Installations complete, type /menu on your bot"
