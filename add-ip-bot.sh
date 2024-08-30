#!/bin/bash
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
#########################
######################################
# // USERNAME IZIN IPP
rm -f /usr/bin/user
username=$(curl -sS https://raw.githubusercontent.com/AngIMAN/permission/main/seler | grep $MYIP | awk '{print $2}')
echo "$username" >/usr/bin/user
rm -f /usr/bin/e
valid=$(curl -sS https://raw.githubusercontent.com/AngIMAN/izin/permission/seler | grep $MYIP | awk '{print $3}')
echo "$valid" > /usr/bin/e

clear
#######################
[[ ! -f /usr/bin/git ]] && apt install git -y &> /dev/null
# COLOR VALIDATION
clear
y='\033[1;93m'
c="\033[0;36m"
g="\e[92;1m"
r="\033[1;31m"
NC='\e[0m'
gray="\e[1;30m"
Blue="\033[1;36m"
GREEN='\033[0;32m'
grenbo="\033[1;95m"
yell='\e[33m'
BGX="\033[42m"
END='\e[0m'
bc="\e[5;36m"
ungu='\033[0;35m'
Green_background="\033[42;37m"
Red_background="\033[41;37m"
Suffix="\033[0m"
NC='\e[0m'
nama=$(cat /etc/xray/username)
#################
CHATID="6198984094"
KEY="7076457502:AAERnCTuuNjEk-lcIIiGguPJ75_NRdvPRsM"
URL="https://api.telegram.org/bot$KEY/sendMessage"
MYIP=$(curl -sS ipv4.icanhazip.com)
TOKEN="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"
REPO="https://raw.githubusercontent.com/AngIMAN/izin/main/ip"
EMAIL="imanfals51@gmail.com"
USER="AngIMAN"

function lane() {
echo -e "${bc} ————————————————————————————————————————${NC}"
}

function LOGO() {
echo -e ""
lane
echo -e "${ungu}            $nama            "
lane
echo -e ""
}

function register() {
echo -e "${ungu}               Register IP              ${Suffix}"
}

function Credit_nbstore() {
sleep 1
echo -e "" 
lane
echo -e "${ungu}      Terimakasih sudah menggunakan-"
lane
echo -e ""
exit 0
}

add-ip() {
today=`date -d "0 days" +"%Y-%m-%d"`
wget -O ip "${REPO}"
clear
LOGO
echo ""
lane
echo -e "MASUKAN IP VPS YANG BELUM DI DAFTAR !"
lane
echo -e ""
read -p "Input IP Address : " ipqu
CLIENT_EXISTS=$(grep -w $ipqu /root/permissionautoscript/ip | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
echo "IP Already Exist !"
exit 0
fi
echo -e ""
read -p "Input Username  : " name
echo -e ""
read -p "Input masaaktif :" exp

exp2=`date -d "${exp} days" +"%Y-%m-%d"`
echo "### ${name} ${exp2} ${ipqu}" >> /root/permissionautoscript/ip

git config --global user.email "${EMAIL}" &> /dev/null
git config --global user.name "${USER}" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m permission &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USER}/permission.git
git push -f https://${TOKEN}@github.com/${USER}/permission.git
rm -rf /root/izinsc
clear
CHATIDD="$CHATIDD"
CHATID="$CHATID"
KEY="$KEY"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>───────────────────────────</code>
<code>   SUCCESS REGISTERED IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ipqu</code>
<code>Registered On  : $today</code>
<code>Expired On     : $exp2</code>
<code>───────────────────────────</code>
"
#curl -s --max-time $TIME -d "chat_id=$CHATIDD&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
lane
echo -e "${g}         SUCCESS ADD IP VPS      $NC"
lane
echo -e "${y}  USERNAME   :${NC}${yell} $name ${NC}"
echo -e "${y}  IP ADDRESS :${NC}${yell} $ipqu ${NC}"
echo -e "${y}  REGISTERED :${NC}${yell} $today ${NC}"
echo -e "${y}  EXPIRED ON :${NC}${yell} $exp2 ${NC}"
lane
Credit_nbstore
}

del-ip() {
    wget -O ip "${REPO}"
    clear
	LOGO
    echo ""
    lane
    echo -e "${g}         LIST IP VPS          $NC"
    lane
    grep -E "^###" "/root/izinsc/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
    lane
	echo ""
    read -p "Input IP Address To Delete : " ipdel
    name=$(cat /root/permissionautoscript/ip | grep $ipdel | cut -d " " -f2)
    exp=$(cat /root/permissionautoscript/ip | grep $ipdel | cut -d " " -f3)
    sed -i "/^### $name $exp $ipdel/d" /root/izinsc/ip
    git config --global user.email "${EMAIL}" &> /dev/null
    git config --global user.name "${USER}" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m permission &> /dev/null
    git branch -M main &> /dev/null
	git remote add origin https://github.com/${USER}/permission.git
	git push -f https://${TOKEN}@github.com/${USER}/permission.git
    rm -rf /root/permissionautoscript
    clear
CHATIDD="$CHATIDD"
CHATID="$CHATID"
KEY="$KEY"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>───────────────────────────</code>
<code>    SUCCESS DELETE IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ipdel</code>
<code>Expired On     : $exp</code>
<code>───────────────────────────</code>
"
#curl -s --max-time $TIME -d "chat_id=$CHATIDD&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
lane
echo -e "${g}      DONE DELETE IP VPS      $NC"
lane
echo -e "${y} USERNAME   :${NC}${yell} $name"
echo -e "${y} IP ADDRESS :${NC}${yell} $ipdel"
echo -e "${y} EXPIRED ON :${NC}${yell} $exp"
lane
Credit_nbstore
echo -e ""
read -p "press enter fot back to menu"
add-ip-bot
}

renew-ip() {
wget -O ip "${REPO}"
clear
LOGO
echo ""
lane
echo -e "${g}        RENEW IP VPS      $NC"
lane
grep -E "^###" "/root/permissionautoscript/ip" | cut -d ' ' -f 2-6 | column -t | sort | uniq
lane
echo ""
read -p "  Input IP Address To Renew : " ipdel
read -p "  Input Days  : " days
name=$(cat /root/permissionautoscript/ip | grep $ipdel | cut -d " " -f2)
exp=$(cat /root/permissionautoscript/ip | grep $ipdel | cut -d " " -f3)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $days))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $name $exp $ipdel/### $name $exp4 $ipdel/g" /root/permissionautoscript/ip
git config --global user.email "${EMAIL}" &> /dev/null
git config --global user.name "${USER}" &> /dev/null
rm -rf .git &> /dev/null
git init &> /dev/null
git add . &> /dev/null
git commit -m izin &> /dev/null
git branch -M main &> /dev/null
git remote add origin https://github.com/${USER}/izin.git
git push -f https://${TOKEN}@github.com/${USER}/izin.git &> /dev/null
rm -rf /root/izinsc
clear
CHATIDD="$CHATIDD"
CHATID="$CHATID"
KEY="$KEY"
TIME="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
TEXT="
<code>───────────────────────────</code>
<code>    SUCCESS RENEW  IP VPS</code>
<code>───────────────────────────</code>
<code>USERNAME       : $name</code>
<code>IP Address     : $ipdel</code>
<code>Expired On     : $exp4</code>
<code>───────────────────────────</code>
"
#curl -s --max-time $TIME -d "chat_id=$CHATIDD&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo ""
lane
echo -e "${g}         DONE RENEW IP VPS      $NC"
lane
echo -e "${y}  USERNAME   :${NC}${yell} $name"
echo -e "${y}  IP ADDRESS :${NC}${yell} $ipdel"
echo -e "${y}  EXPIRED ON :${NC}${yell} $exp4"
lane
Credit_nbstore
echo -e ""
read -p "press enter fot back to menu"
add-ip-bot
}
clear
echo ""
echo ""
echo -e "   ${BLUE}_______________________________$NC"
echo -e "   \e[1;32m  WELCOME TO REGISTER IPVPS $NC"
echo -e "   ${BLUE}_______________________________$NC"
echo ""
echo -e " $g 1.$NC ${c}ADD IP VPS "$NC     
echo -e " $g 2.$NC ${c}DELETE IP VPS"$NC
echo -e " $g 3.$NC ${c}RENEW IP VPS"$NC
echo -e " $g 4.$NC ${c}Back To menu"$NC
lane
echo ""
read -p " Select From Options [1 - 3 or x] : " menu
case $menu in
1 | 01)
clear
add-ip
;;
2 | 02)
clear
del-ip
;;
3 | 03)
clear
renew-ip
;;
4 | 04)
menu
;;
*)
exit
;;
esac
fi
