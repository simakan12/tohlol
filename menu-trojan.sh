#!/bin/bash
source /usr/bin/base-script
clear
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "$GRN1 Buat Akun Trojan GFW/TCP"
echo -e "$GRN2 Buat Akun Trojan GO/WS"
echo -e "$GRN3 Buat Akun Trojan GRPC"
echo -e "$GRN4 Buat Akun Semua Trojan"
echo -e "$GRN5 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-5\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		addtr
		exit
		;;
		2)
		clear
		addtrws
		exit
		;;
		3)
		clear
		addtrgrpc
		exit
		;;
		4)
		clear
		addtrojan
		exit
		;;
		5)
		clear
		exit
		;;
	esac
