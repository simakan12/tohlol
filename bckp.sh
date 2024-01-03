#!/bin/bash
IP=$(wget -qO- icanhazip.com);
Domain=$(cat /root/domain);
date=$(date +"%Y-%m-%d")
email=$(cat /home/email)
clear
sleep 1
echo Membuat Directory
mkdir /root/backup
sleep 1
echo Start Backup
clear
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp /etc/passwd /root/backup/ &> /dev/null
cp /etc/group /root/backup/ &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /var/www/html /root/backup/public_html &> /dev/null
cp -r /etc/nginx/conf.d/55.conf /root/backup/55.conf &> /dev/null
cp -r /etc/nginx/conf.d/80.conf /root/backup/80.conf &> /dev/null
cp -r /etc/nginx/conf.d/8080.conf /root/backup/8080.conf &> /dev/null
cp -r /etc/nginx/conf.d/8083.conf /root/backup/8083.conf &> /dev/null
cp -r /etc/nginx/conf.d/8880.conf /root/backup/8880.conf &> /dev/null
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
wget -q -O /root/.config/rclone/rclone.conf "http://sg.warnetgrg.my.id:81/rclone.conf"
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download&confirm"
echo -e "The following is a link to your vps data backup file.

Your VPS IP : $IP
Your Domain : $Domain
Link Backup : $link

If you want to restore data, please enter the link above.

Thank You For Using Our Services" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
rm -f /root/.config/rclone/rclone.conf
echo Done
