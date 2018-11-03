# ~/.bashrc: executed by bash(1) for non-login shells.
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

source "${HOME}/.colors"
_BATTERY="/org/freedesktop/UPower/devices/battery_BAT0"

function _bat() {
	local life=$(upower -i ${_BATTERY} | grep -o -m 1 '[0-9]*%')
	
	if [[ -z "$1" ]]; then		
		case ${life} in
			?%|1*) 	echo -ne ${RD}  ;;
			[23]*) 	echo -ne ${OR}  ;;
			[45]*) 	echo -ne ${YLW} ;;
			[67]*) 	echo -ne '\e[38;5;154m' ;; # green-yellow 
			*)      echo -ne ${GRN} ;;
		esac
	fi

	echo -en "${life%\%}${DEF}"
}

function _code() {
	[[ $? = '1' ]] && echo -e "${RD}" || echo -e "${GRN}"
}

SPACESHIP_PROMPT="${BLD}             "\
"┍\$(_code)∿∿\$(sed s/./∿/g <<< '\w')∿∿${DEF}┑\n"\
"┍❮${BLU}\D{%I:%M} ${YLW}🗲\$(_bat)❯"\
"┹⊣⟬${BLU}\w${DEF}⟭⊢┛\n"\
"┕─╼ \[${EC}\]"

HTML_PROMPT="\n\[${BLD}\]<\[${OR}\]input"\
"\[${GRN}\] time\[${DEF}\]='\[${YLW}\]\D{%l:%M}\[${DEF}\]'"\
"\[${GRN}\] bat\[${DEF}\]=\$(_bat)"\
"\[${GRN}\] wd\[${DEF}\]='\[${YLW}\]\w\[${DEF}\]'"\
" />\n    \[${GRN}\]\$\[${DEF}\]>\[${EC}\] "

SIMPLE_PROMPT="\[${BLD}${YLW}\]🗲\$(_bat) \[${BLU}\]\${PWD}\[${DEF}\]:\[${GRN}\]\$\[${EC}\] "

SIMPLE_PROMPT_2="BATTERY: \$(_bat)%   TIME: \D{%I:%M}   DIRECTORY: \w\n"\
"\$> "

stty -ixon

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi

[[ -e "${HOME}/.bash_aliases" ]] && source "${HOME}/.bash_aliases"

function _IBM_HEADER() {
	echo -e "Current date is $(date +%A,\ %B\ %d,\ %Y)"
	echo -e "Current time is $(date +%r)"
	echo
	echo "The IBM Personal Computer DOS"
	echo "Version 1.10 (C)Copyright IBM Corp 1981, 1982, 1983"
	echo
}

function _COMMODORE_HEADER() {
	echo "    **** COMMODORE 64 BASIC V2 ****"
	echo
	echo " 2GB RAM SYSTEM  $(df | grep /dev/sda1 | grep -oP "\d+(?=  \d+%)") BASIC BYTES FREE"
	echo
	echo "READY."
	echo
}

echo "Select theme:"
echo

select name in html spaceship IBM "Commodore 64"; do
    case $name in
        html) 
            PS1="$HTML_PROMPT" ;;
        spaceship) 
            PS1="$SPACESHIP_PROMPT" ;;
        IBM)
			PS1="$SIMPLE_PROMPT" 
			HEADER="_IBM_HEADER" ;;
		"Commodore 64")
			PS1="$SIMPLE_PROMPT_2"
			HEADER="_COMMODORE_HEADER" ;;
    esac    

    clear
    ${HEADER}
    break
done

alias clear="clear; ${HEADER}"