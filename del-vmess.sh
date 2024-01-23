#!/bin/bash
sfile="http://sg.warnetgrg.my.id:81/tohlol"
source /usr/bin/base-script

# Authentication
IPADDR=$( curl -s https://ipinfo.io/ip )
IP_REGIS=$( curl -s $sfile/data.txt | grep -w $IPADDR | awk '{print $1}' )
NAME_REGIS=$( curl -s $sfile/data.txt | grep -w $IPADDR | awk '{print $2}' )
EXP_REGIS=$( curl -s $sfile/data.txt | grep -w $IPADDR | awk '{print $3}' )

# Check IP Register
	clear
	sleep 0.5
	echo Checking IP
	sleep 0.5
	echo Done
if [[ $IPADDR == $IP_REGIS ]]; then
        export REGISTER='true'
else
        clear; echo "Mohon maaf, IP anda belum terdaftar !"; exit 1
fi

# Check Expired
waktu_sekarang=$(date -d "0 days" +"%Y-%m-%d");
expired_date="$EXP_REGIS"
now_in_s=$(date -d "$waktu_sekarang" +%s);
exp_in_s=$(date -d "$expired_date" +%s);
days_left=$(( ($exp_in_s - $now_in_s) / 86400 ));
if [[ $days_left -lt 0 ]]; then
        clear; echo "Mohon maaf, script telah expired silakan melakukan renew terlebih dahulu !"; exit 1
fi

clear
echo -e " == Dklongtong == " | lolcat -a
echo -e ""
echo -e "$GRN1 Hapus VMess WS"
echo -e "$GRN2 Hapus VMess GRPC"
echo -e "$GRN3 Keluar/Batal"
echo -e ""
read -p "$(echo -e " Pilih Opsi\e[32m [\e[0m1-3\e[32m]\e[0m: ")" Accounts
echo -e "\n\n"
sleep 1
clear
case $Accounts in
		1)
		clear
		delvmws
		exit
		;;
		2)
		clear
		delvmgrpc
		exit
		;;
		3)
		clear
		exit
		;;
	esac