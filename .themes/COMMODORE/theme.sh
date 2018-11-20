#!/bin/bash
function _bat() {
	local life=$(upower -i "/org/freedesktop/UPower/devices/battery_BAT0" | grep -o -m 1 '[0-9]*%')
	echo -en ${life%\%}
}

PS1="BAT: \$(_bat)%   TIME: \D{%I:%M}   DIR: \w\n"\
"\$> "

function _HEADER() {
	echo "    **** COMMODORE 64 BASIC V2 ****"
	echo
	echo " 2GB RAM SYSTEM  $(df | grep /dev/sda1 | grep -oP "\d+(?=  \d+%)") BASIC BYTES FREE"
	echo
	echo "READY."
	echo
}
