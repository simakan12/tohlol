#!/bin/bash
tanggal=$(date +"%m-%d-%Y")
waktu=$(date +"%T")
echo "Berhasil membersihkan log pada tanggal $tanggal pukul $waktu." >> /root/log-clearlog.txt
/usr/bin/clearlog