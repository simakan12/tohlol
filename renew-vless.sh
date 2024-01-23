#!/bin/bash
source /usr/bin/base-script
clear
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "$GRN1 Perpanjang VLess WS"
echo -e "$GRN2 Perpanjang VLess GRPC"
echo -e "$GRN3 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-2\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		renewvlws
		exit
		;;
		2)
		clear
		renewvlgrpc
		exit
		;;
		3)
		clear
		exit
		;;
	esac
