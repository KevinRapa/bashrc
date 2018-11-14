function _batClr() {
	local life=$(upower -i "/org/freedesktop/UPower/devices/battery_BAT0" | grep -o -m 1 '[0-9]*%')
	
	case ${life} in
		?%|1*) 	echo -ne ${RD}  ;;
		[23]*) 	echo -ne ${OR}  ;;
		[45]*) 	echo -ne ${YLW} ;;
		[67]*) 	echo -ne '\e[38;5;154m' ;; # green-yellow 
		*)      echo -ne ${GRN} ;;
	esac
}

function _bat() {
	local bat=$(upower -i "/org/freedesktop/UPower/devices/battery_BAT0" | grep -o -m 1 '[0-9]*%')
	echo -n "${bat%\%}"
}

PS1="\[${BLD}${YLW}\]🗲"\
'\[$(_batClr)\]$(_bat)'\
" \[${BLU}\]\${PWD}\[${DEF}\]:\[${GRN}\]\$\[${EC}\] "

function _HEADER() {
	echo -e "Current date is $(date +%A,\ %B\ %d,\ %Y)"
	echo -e "Current time is $(date +%r)"
	echo
	echo "The IBM Personal Computer DOS"
	echo "Version 1.10 (C)Copyright IBM Corp 1981, 1982, 1983"
	echo
}