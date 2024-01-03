#!/bin/bash
echo "This Feature Can Only Be Used According To Vps Data With This Autoscript"
echo "Please input link to your vps data backup file."
echo "You can check it on your email if you run backup data vps before."
read -rp "Link File: " -e url
wget -O backup.zip "$url"
unzip backup.zip
rm -f backup.zip
sleep 1
echo Start Restore
cd /root/backup
cp /root/backup/passwd /etc/ &> /dev/null
cp /root/backup/group /etc/ &> /dev/null
cp -r /root/backup/xray /etc/ &> /dev/null
cp -r /root/backup/55.conf /etc/nginx/conf.d/ &> /dev/null
cp -r /root/backup/8080.conf /etc/nginx/conf.d/ &> /dev/null
cp -r /root/backup/8083.conf /etc/nginx/conf.d/ &> /dev/null
cp -r /root/backup/80.conf /etc/nginx/conf.d/ &> /dev/null
cp -r /root/backup/8880.conf /etc/nginx/conf.d/ &> /dev/null
cp -r /root/backup/public_html /var/www/html &> /dev/null
cp -r /root/backup/cron.d /etc/ &> /dev/null
expired
rm -rf /root/backup
sleep 1
systemctl restart xray &> /dev/null
systemctl restart xray@none &> /dev/null
systemctl restart xray@sso &> /dev/null
systemctl restart nginx &> /dev/null
rm -rf /root/backup &> /dev/null
echo
read -n 1 -s -r -p "Press any key to back on menu"
menu
echo Done
