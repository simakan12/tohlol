#!/bin/bash
source /usr/bin/base-script
clear
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "$GRN1 Buat Akun VLess WS"
echo -e "$GRN2 Buat Akun VLess GRPC"
echo -e "$GRN3 Buat Akun Semua VMess"
echo -e "$GRN4 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-4\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		addvlws
		exit
		;;
		2)
		clear
		addvlgrpc
		exit
		;;
		3)
		clear
		addvless
		exit
		;;
		4)
		clear
		exit
		;;
	esac
