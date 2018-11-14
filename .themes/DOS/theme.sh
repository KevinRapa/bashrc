#!/bin/bash
function _bat() {
	local life=$(upower -i "/org/freedesktop/UPower/devices/battery_BAT0" | grep -o -m 1 '[0-9]*%')
	echo -en "${life%\%}${DEF}"
}

function _pwd() {
	echo -n "${PWD//\//\\}"
}

PS1="BATTERY: \$(_bat)%   TIME: \D{%I:%M}\nC:\$(_pwd)> "

function _HEADER() {
	echo "Microsoft<R> MS-DOS<R>  Version 3.30"
	echo "             <C>Copyright Microsoft Corp 1981 - 1987."
	echo
	echo
}
