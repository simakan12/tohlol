#!/bin/bash
source /usr/bin/base-script
sttt=`cat /root/log-install.txt`

if [ ! -f "/etc/afak.conf" ]; then
ISP=`curl -sS ip-api.com | grep -w "isp" | awk '{print $3,$4,$5,$6,$7,$8,$9}' | cut -d'"' -f2 | cut -d',' -f1 | tee -a /etc/afak.conf`
CITY=`curl -sS ip-api.com | grep -w "city" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf`
WKT=`curl -sS ip-api.com | grep -w "timezone" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf`
IPVPS=`curl -sS ip-api.com | grep -w "query" | awk '{print $3}' | cut -d'"' -f2 | tee -a /etc/afak.conf`
else
ISP=$(cat /etc/afak.conf | awk 'NR==1 {print $1,$2,$3,$4,$5,$6,$7,$8}')
CITY=$(cat /etc/afak.conf | awk 'NR==2 {print $1,$2,$3,$4,$5,$6,$7,$8}')
WKT=$(cat /etc/afak.conf | awk 'NR==3 {print $1,$2,$3,$4,$5,$6,$7,$8}')
IPVPS=$(cat /etc/afak.conf | awk 'NR==4 {print $1,$2,$3,$4,$5,$6,$7,$8}')
fi

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m               ⇱ INFORMATION MENU ⇲               \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;32mAbout\033[0m :

   Isp Name  : $ISP
   City      : $CITY
   Time      : $WKT
   IPVPS     : $IPVPS
   DOMAIN    : $(cat /etc/domain)

   \033[1;33mThis script by : Dklongtong | https://t.me/Dklongtong\033[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m
\033[1;32mPort Information\033[0m :

$sttt

\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

echo -e "$GRN1 Menu-Akun"
echo -e "$GRN2 Restart Layanan"
echo -e "$GRN3 Penggunaan RAM"
echo -e "$GRN4 SpeedTest"
echo -e "$GRN5 Backup/Restore"
echo -e "$GRN6 Reboot"
echo -e "$GRN7 Keluar"
echo -e ""
read -p "$(echo -e " Pilih dari opsi\e[32m [\e[0m1-7\e[32m]\e[0m: ")" Options
echo -e ""
clear
case $Options in
                1)
                clear
                menu-akun
                exit
                ;;
                2)
                clear
                restart_services
                exit
                ;;
                3)
                clear
                ram
                exit
                ;;
                4)
                clear
                speedtest
                exit
                ;;
                5)
                backup-restore
                exit
                ;;
				6)
                reboot
                exit
                ;;
                7)
                clear
                exit
                ;;
        esac

#fim
