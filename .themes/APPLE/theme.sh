function _bat() {
	local life=$(upower -i "/org/freedesktop/UPower/devices/battery_BAT0" | grep -o -m 1 '[0-9]*%')
	echo -n "${life%\%}"
}

function _HEADER() {
	echo "DOS VERSION 3.3                      $(date +%D)"
	echo
	echo "APPLE ][ PLUS OR ROMCARD             SYSTEM MASTER"
	echo
	echo
}

PS1="\$(_bat)%\[${DEF}\]]"