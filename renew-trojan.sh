#!/bin/bash
source /usr/bin/base-script
clear
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "$GRN1 Perpanjang Trojan GFW/TCP"
echo -e "$GRN2 Perpanjang Trojan GO/WS"
echo -e "$GRN3 Perpanjang Trojan GRPC"
echo -e "$GRN4 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-4\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		renewtr
		exit
		;;
		2)
		clear
		renewtrws
		exit
		;;
		3)
		clear
		renewtrgrpc
		exit
		;;
		4)
		clear
		exit
		;;
	esac
