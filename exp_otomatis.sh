#!/bin/bash
tanggal=$(date +"%m-%d-%Y")
waktu=$(date +"%T")
echo "Berhasil cek exp pada tanggal $tanggal pukul $waktu." >> /root/log-exp.txt
/usr/bin/xptr
/usr/bin/xpws
/usr/bin/xpvmws
/usr/bin/xpvlws
/usr/bin/xptrgrpc
/usr/bin/xpvmgrpc
/usr/bin/xpvlgrpc
systemctl restart xray
systemctl restart xray@none
systemctl restart xray@sso