#!/bin/bash
echo -e ""
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "   [1] Restart Semua Layanan"
echo -e "   [2] Restart Xray-core"
echo -e "   [3] Restart Nginx"
echo -e "   [4] Restart Firewall"
echo -e "   [5] Exit"
echo -e ""
read -p "   Pilih dari opsi [1-5]: " Restart
echo -e ""
sleep 3
clear
case $Restart in
		1)
		clear
		systemctl restart xray
		systemctl restart xray@none
		systemctl restart xray@sso
		systemctl restart nginx
		csf -r
		echo -e ""
    echo -e " == Dklongtong == " | lolcat -a
    echo -e ""
    echo -e " All Services Restarted"
    echo -e ""
		exit
		;;
		2)
		clear
		systemctl restart xray
		systemctl restart xray@none
		systemctl restart xray@sso
		echo -e ""
    echo -e " == Dklongtong == " | lolcat -a
    echo -e ""
		echo -e " Xray-core Service Restarted"
		echo -e ""
		exit
		;;
		3)
		clear
		systemctl restart nginx
		echo -e ""
    echo -e " == Dklongtong == " | lolcat -a
    echo -e ""
		echo -e " Nginx Service Restarted"
		echo -e ""
		exit
		;;
		4)
		clear
		csf -r
		echo -e ""
    echo -e " == Dklongtong == " | lolcat -a
    echo -e ""
		echo -e " CSF-Firewall Service Restarted"
		echo -e ""
		exit
		;;
		5)
		clear
		exit
		;;
	esac