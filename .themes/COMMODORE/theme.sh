#!/bin/bash

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
