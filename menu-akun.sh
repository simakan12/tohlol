#!/bin/bash
sfile=""
source /usr/bin/base-script
clear
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "$GRN1 Buat Akun Trojan"
echo -e "$GRN2 Buat Akun VMess"
echo -e "$GRN3 Buat Akun VLess"
echo -e "$GRN4 Buat Akun ShadowSocks Outline"
echo -e "$GRN5 Perpanjang Akun Trojan"
echo -e "$GRN6 Perpanjang Akun VMess"
echo -e "$GRN7 Perpanjang Akun VLess"
echo -e "$GRN8 Perpanjang Akun ShadowSocks Outline"
echo -e "$GRN9 Hapus Akun Trojan"
echo -e "$GRN10 Hapus Akun VMess"
echo -e "$GRN11 Hapus Akun VLess"
echo -e "$GRN12 Hapus Akun ShadowSocks Outline"
echo -e "$GRN13 Cek Login Trojan"
echo -e "$GRN14 Cek Login VMess"
echo -e "$GRN15 Cek Login VLess"
echo -e "$GRN16 Cek Login ShadowSocks Outline"
echo -e "$GRN17 Cek Traffik penggunaan Xray"
echo -e "$GRN18 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-18\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		menu-trojan
		exit
		;;
		2)
		clear
		menu-vmess
		exit
		;;
		3)
		clear
		menu-vless
		exit
		;;
		4)
		clear
		addsso
		exit
		;;
		5)
		clear
		renew-trojan
		exit
		;;
		6)
		clear
		renew-vmess
		exit
		;;
		7)
		clear
		renew-vless
		exit
		;;
		8)
		clear
		renewsso
		exit
		;;
		9)
		clear
		del-trojan
		exit
		;;
		10)
		clear
		del-vmess
		exit
		;;
		11)
		clear
		del-vless
		exit
		;;
		12)
		clear
		delsso
		exit
		;;
		13)
		cek-trojan
		exit
		;;
		14)
		cek-vmess
		exit
		;;
		15)
		cek-vless
		exit
		;;
		16)
		ceksso
		exit
		;;
		17)
		cek-kuota
		exit
		;;
		18)
		clear
		exit
		;;
	esac
