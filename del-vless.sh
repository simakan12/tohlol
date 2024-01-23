#!/bin/bash
source /usr/bin/base-script
clear
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "$GRN1 Hapus VLess WS"
echo -e "$GRN2 Hapus VLess GRPC"
echo -e "$GRN3 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-3\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		delvlws
		exit
		;;
		2)
		clear
		delvlgrpc
		exit
		;;
		3)
		clear
		exit
		;;
	esac
