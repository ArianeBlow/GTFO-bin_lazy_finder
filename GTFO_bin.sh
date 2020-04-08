#!/bin/bash
clear
#**************************************************
#Gtfo's bin checker                               *
#By ArianeBlow                                    *
#Priv ESC vulnerabilitie checker for OS Linux/UNIX*
# USAGE = chmod +x GTFO_bin.sh && ./GTFO_bin.sh   *
#**************************************************

#FONC COLOR
red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
#echo "${red}red text ${green}green text${reset}"                   

#FONC banner
Banner()
{
clear
echo "     GTFO Bin Priv ESC identifier"
echo ''
echo '	       By ArianeBlow'
echo '		     0'
echo "		    /${red}s${reset}\ "
echo '		    / \'
echo ' 	     That is Super-Man ?'
echo ''
echo ''
echo ''
}

#FONC make list
make_gtfo_list()
{
cd /tmp
wget https://gtfobins.github.io/index.html && echo "${green}[+] Doownload OK"
cat index.html | grep 'class="bin-name">' | cut -d ">" -f 3 | cut -d "<" -f 1 >> /tmp/gtfo_bin.lst && rm -r /tmp/index.html
echo "${green}[+] Got some ${red}Priv ESC ${green}vulns, how many ? ${reset}" && cat gtfo_bin.lst | wc -l  
}

#FONC make_sudoing_list
make_sudo_list()
{
cd /tmp
sudo -l | grep ")" | cut -d ")" -f 2 | cut -d " " -f 2 >> /tmp/gtfo_bin.lst
#DEBUG MOD ************************
#echo "TEST" >> /tmp/gtfo_bin.lst
}

#FONC checking for vulns
vuln_check()
{
touch /tmp/gtfo_bin_found.lst
#DEBUG MOD ************************
#echo "TEST" >> /tmp/gtfo_bin.lst
uniq -d /tmp/gtfo_bin.lst >> /tmp/gtfo_bin_found.lst
cat /tmp/gtfo_bin_found.lst
}

#FONC clearing cache & datas
clear_data_cache()
{
rm -r /tmp/gtfo_bin.lst && echo "gtfo list deleted"
rm -r /tmp/gtfo_bin_found.lst && echo "gtfo_bin_found.lst deleted"
history -c
echo "CLEARING DATA & history !${green}OK ${reset}!"
}

#Main()
Banner
echo "${red}[-] Changing PATH to TMP${reset}"
cd /tmp/
echo "${green}[+] OK${reset}"
echo "${red}[-] Download and form the GTFO_bin list from git.io ...${reset}"
make_gtfo_list
Banner
echo "${green}[+] Download OK !"
echo "${red}[-] Search for vulnerable bin"
make_sudo_list
echo "${green}[+] Done ... Check for possible Exploits found ... ${red}"
vuln_check
echo "Done ! If nothing was found, try harder !"
echo "******************************************${know}"
#DEBUG MOD {Uncomment the echo commannds and the string "TEST" is here}
cat /tmp/gtfo_bin_found.lst
echo "${red}******************************************${reset}"
clear_data_cache
