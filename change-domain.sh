#!/bin/bash
source /usr/bin/base-script
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "1\e[1;33m)\e[m Ganti Domain PRIBADI"
echo -e "2\e[1;33m)\e[m Renew Cert"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-3\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
                1)
		clear
		changedomain
		exit
		;;
		2)
		clear
		renewcert
		exit
                ;;
                3)
		clear
		exit
		;;
	esac