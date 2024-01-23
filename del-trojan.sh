#!/bin/bash
source /usr/bin/base-script
clear
echo -e " == DKLONGTONG == " | lolcat -a
echo -e ""
echo -e "$GRN1 Hapus Trojan GFW/TCP"
echo -e "$GRN2 Hapus Trojan GO/WS"
echo -e "$GRN3 Hapus Trojan GRPC"
echo -e "$GRN4 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-4\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		deltr
		exit
		;;
		2)
		clear
		deltrws
		exit
		;;
		3)
		clear
		deltrgrpc
		exit
		;;
		4)
		clear
		exit
		;;
	esac
