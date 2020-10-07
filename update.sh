!#/bin/bash
#Colors

clear
red='\e[0;31m'
green='\e[1;32m'
orange='\e[1;33m'
lightblue='\e[0;34m'
purple='\e[0;35m'
cyan='\e[0;36m'
lightgray='\e[0;37m'
darkgray='\e[1;30em'
lightred='\e[1;31m'
lightgreen='\e[0;32m'
yellow='\e[0;49;93m'
blue='\e[1;34m'
lightpurple='\e[1;35m'
lightcyan='\e[1;36m'
white='\e[1;37m'
nc="\e[0m"

#checking for internet

while true; do
echo -e "$yellow""Checking for internet connection$nc"
sleep 0.1
clear
echo -e "$yellow""Checking for internet connection.$nc"
sleep 0.1
clear
echo -e "$yellow""Checking for internet connection..$nc"
sleep 0.1
clear
echo -e "$yellow""Checking for internet connection...$nc"
sleep 0.1
clear
done & 
trap 'kill $!' SIGTERM SIGKILL
sleep 2

wget -q --spider https://www.google.com

if [ $? -eq 0 ]; then
    echo -e "$green""Connected to internet$nc [$green✓$nc]"
    sleep 1 
    echo """Updating NetTool from Github..."
    sleep 1
	git reset HEAD --hard
	git pull origin master
	echo "DONE"
	echo "* - Applying Execution Permissions to NetTool..."
	sleep 1
	chmod +x nettool.sh >/dev/null 2>&1
	chmod +x update.sh >/dev/null 2>&1
	sleep 1
	echo DONE 
	kill $!
else   
    echo -e "$lightred""No internet connection$nc [$ligthred✗$nc]$nc"
    echo -e "$yellow""Please make sure you are connected to internet!" "$nc"
	kill $!
    exit 1
fi
kill $!
