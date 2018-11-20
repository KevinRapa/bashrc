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

function _code() {
	[[ $? = '1' ]] && echo -e "${RD}" || echo -e "${GRN}"
}

function _HEADER() {
	echo
	date
	echo
}

HTML_PROMPT="\n\[${BLD}\]<\[${OR}\]input"\
"\[${GRN}\] time\[${DEF}\]='\[${YLW}\]\D{%l:%M}\[${DEF}\]'"\
"\[${GRN}\] bat\[${DEF}\]=\$(_bat)"\
"\[${GRN}\] wd\[${DEF}\]='\[${YLW}\]\w\[${DEF}\]'"\
" />\n    \[${GRN}\]\$\[${DEF}\]>\[${EC}\] "

PS1="${BLD}             "\
"┍\$(_code)∿∿∿\$(sed s/./∿/g <<< '\w')∿∿∿${DEF}┑\n"\
"┍❮${BLU}\D{%I:%M} ${YLW}🗲\$(_bat)❯"\
"┹⊣⟬ ${BLU}\w${DEF} ⟭⊢┛\n"\
"┕─╼ \[${EC}\]"
