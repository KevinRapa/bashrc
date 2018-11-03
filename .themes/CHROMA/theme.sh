function _code() {
	[[ $? = '1' ]] && echo -e "${RD}" || echo -e "${GRN}"
}

HTML_PROMPT="\n\[${BLD}\]<\[${OR}\]input"\
"\[${GRN}\] time\[${DEF}\]='\[${YLW}\]\D{%l:%M}\[${DEF}\]'"\
"\[${GRN}\] bat\[${DEF}\]=\$(_bat)"\
"\[${GRN}\] wd\[${DEF}\]='\[${YLW}\]\w\[${DEF}\]'"\
" />\n    \[${GRN}\]\$\[${DEF}\]>\[${EC}\] "

PS1="${BLD}             "\
"┍\$(_code)∿∿\$(sed s/./∿/g <<< '\w')∿∿${DEF}┑\n"\
"┍❮${BLU}\D{%I:%M} ${YLW}🗲\$(_bat)❯"\
"┹⊣⟬${BLU}\w${DEF}⟭⊢┛\n"\
"┕─╼ \[${EC}\]"