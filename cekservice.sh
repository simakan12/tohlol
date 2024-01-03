#!/bin/bash

# // Code for service
export RED='\033[0;31m';
export GREEN='\033[0;32m';
export YELLOW='\033[0;33m';
export BLUE='\033[0;34m';
export PURPLE='\033[0;35m';
export CYAN='\033[0;36m';
export LIGHT='\033[0;37m';
export NC='\033[0m';

# // Export Banner Status Information
export ERROR="[${RED} ERROR ${NC}]";
export INFO="[${YELLOW} INFO ${NC}]";
export OKEY="[${GREEN} OKEY ${NC}]";
export PENDING="[${YELLOW} PENDING ${NC}]";
export SEND="[${YELLOW} SEND ${NC}]";
export RECEIVE="[${YELLOW} RECEIVE ${NC}]";

# // VAR
if [[ $(netstat -ntlp | grep -i xray | grep -i 127.0.0.1:2001 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '2001' ]]; then
    TRWS_STT="${GREEN}Okay${NC}";
else
    TRWS_STT="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i xray | grep -i :::443 | awk '{print $4}' | cut -d: -f4 | xargs | sed -e 's/ /, /g') == '443' ]]; then
    TRT_STT="${GREEN}Okay${NC}";
else
    TRT_STT="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i xray | grep -i 127.0.0.1:31304 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '31304' ]]; then
    TRG_STT="${GREEN}Okay${NC}";
else
    TRG_STT="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i xray | grep -i 127.0.0.1:2002 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '2002' ]]; then
    VMW_STT="${GREEN}Okay${NC}";
else
    VMW_STT="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i xray | grep -i 127.0.0.1:56802 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '56802' ]]; then
    VMG_STT="${GREEN}Okay${NC}";
else
    VMG_STT="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i xray | grep -i 127.0.0.1:2004 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '2004' ]]; then
    VLW_STT="${GREEN}Okay${NC}";
else
    VLW_STT="${RED}NotOkay${NC}";
fi
if [[ $(netstat -ntlp | grep -i xray | grep -i 127.0.0.1:56803 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '56803' ]]; then
    VLG_STT="${GREEN}Okay${NC}";
else
    VLG_STT="${RED}Not Okay${NC}";
fi
if [[ $(netstat -ntlp | grep -i xray | grep -i 127.0.0.1:47466 | awk '{print $4}' | cut -d: -f2 | xargs | sed -e 's/ /, /g') == '47466' ]]; then
    TRF="${GREEN}Okay${NC}";
else
    TRF="${RED}Not Okay${NC}";
fi
if [[ $(systemctl status nginx | grep -w running | awk '{print $3}' | sed 's/(//g' | sed 's/)//g' | sed 's/ //g') == 'running' ]]; then
    NGINX="${GREEN}Okay${NC}";
else
    NGINX="${RED}Not Okay${NC}";
fi

echo ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m            ⇱ Service Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️ Nginx                :$NGINX"
echo -e "❇️ TrojanTCP            :$TRT_STT"
echo -e "❇️ TrojanWS             :$TRWS_STT"
echo -e "❇️ TrojanGRPC           :$TRG_STT"
echo -e "❇️ VMessWS              :$VMW_STT"
echo -e "❇️ VMessGRPC            :$VMG_STT"
echo -e "❇️ VLessWS              :$VLW_STT"
echo -e "❇️ VLessGRPC            :$VLG_STT"
echo -e "❇️ TrafficXray          :$TRF"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "ALL XRAY PORT 443 OKE"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo ""
