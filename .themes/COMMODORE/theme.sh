#!/bin/bash
function _bat() {
	local life=$(upower -i "/org/freedesktop/UPower/devices/battery_BAT0" | grep -o -m 1 '[0-9]*%')
		
	case ${life} in
		?%|1*) 	echo -ne ${RD}  ;;
		[23]*) 	echo -ne ${OR}  ;;
		[45]*) 	echo -ne ${YLW} ;;
		[67]*) 	echo -ne '\e[38;5;154m' ;; # green-yellow 
		*)      echo -ne ${GRN} ;;
	esac

	echo -en "${life%\%}${DEF}"
}

PS1="BATTERY: \$(_bat)%   TIME: \D{%I:%M}   DIRECTORY: \w\n"\
"\$> "

function _HEADER() {
	echo "    **** COMMODORE 64 BASIC V2 ****"
	echo
	echo " 2GB RAM SYSTEM  $(df | grep /dev/sda1 | grep -oP "\d+(?=  \d+%)") BASIC BYTES FREE"
	echo
	echo "READY."
	echo
}
