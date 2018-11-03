PS1="\[${BLD}${YLW}\]🗲\$(_bat) \[${BLU}\]\${PWD}\[${DEF}\]:\[${GRN}\]\$\[${EC}\] "

function _HEADER() {
	echo -e "Current date is $(date +%A,\ %B\ %d,\ %Y)"
	echo -e "Current time is $(date +%r)"
	echo
	echo "The IBM Personal Computer DOS"
	echo "Version 1.10 (C)Copyright IBM Corp 1981, 1982, 1983"
	echo
}