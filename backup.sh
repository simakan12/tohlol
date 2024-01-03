#!/bin/bash
IP=$(wget -qO- icanhazip.com);
date=$(date +"%Y-%m-%d")
clear
echo " Enter Your Email To Receive Message"
read -rp " Email: " -e email
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
cp -r /etc/cron.d /root/backup/cron.d &> /dev/null
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
wget -q -O /root/.config/rclone/rclone.conf "http://sg.warnetgrg.my.id:81/rclone.conf"
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=(`echo $url | grep '^https' | cut -d'=' -f2`)
link="https://drive.google.com/u/4/uc?id=${id}&export=download&confirm"
echo -e "The following is a link to your vps data backup file.

Your VPS IP $IP

$link

If you want to restore data, please enter the link above.

Thank You For Using Our Services" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -r /root/$IP-$date.zip
rm -f /root/.config/rclone/rclone.conf
echo "Done"
echo "Please Check Your Email"
