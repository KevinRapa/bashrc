#!/bin/bash

alias rc="vim ~/.bashrc"
alias al="vim ~/.bash_aliases"
alias a='amixer -q -D pulse sset Master 10%-'
alias d='amixer -q -D pulse sset Master 10%+'
alias tog='amixer -q -D pulse sset Master toggle'
alias set="xfce4-settings-manager 2> /dev/null &"
alias fin="setxkbmap fi"
alias eng="setxkbmap us"
alias search="sudo apt-cache search"
alias install="sudo apt-get install"
alias update="sudo apt-get update; galliumos-update"
alias todo="sub ~/Docs/school/TODO.txt"
alias sched="sub ~/Docs/Schedule.txt"
alias zork="(chromium-browser https://www.draw.io/#G1qkz-E8dEXbprS60UP2ONoZyyTaIbIufn &> /dev/null &) && frotz ~/Applications/Roms/ZORK/Zork1/DATA/ZORK1.DAT"
# enable color support of ls and also add handy aliases
eval "$(dircolors -b)"
alias ls='ls -F'
alias grep='grep --color=auto'

function vim() {
    (~/Applications/retro-term/cool-retro-term --fullscreen --workdir ${PWD} -e /usr/bin/vim ${1} &) &> /dev/null
}

function s() {
    (xbacklight -dec ${1:-1} &)
} 
function w() {
    (xbacklight -inc ${1:-1} &)
} 

function _music() {
    unset list tracks
    let i=0

    for fl in ${1}/*; do
        unset delim

        if [[ -f ${fl} ]]; then
            (( ${i} & 1 )) || local delim="\n"
            local tracks="${tracks}${delim:- }$(basename ${fl%.*})"
        else
            local list="${list} ${fl}"
        fi

        let i^=1
    done

    if [[ -n "${tracks}" ]]; then
        echo -e "${BLD}${BLU}$(basename "${1}"):${EC}"
        echo -e "${tracks}" | column -t -c 2 | sed -e 's/^/\t/g'
    fi

    for dr in ${list}; do
        _music "${dr}"
    done
}

function play() {
    if [[ -z "$1" ]]; then
        echo
        _music ~/Music
        echo
    else
        local fnd=$(find ~/Music -iname ${1}* | head -1)
        
        [[ -z "${fnd}" ]] && local fnd=$(find ~/Music -iname *${1}* | head -1)

        if [[ -n "${fnd}" ]]; then
            (deadbeef "${fnd}" &) &> /dev/null
        else    
        play
        fi
    fi
}

function web() {
    case "$1" in
        schl) 
            local sites='https://www.csee.umbc.edu/courses/undergraduate/426/fall18/
                 https://my.umbc.edu/login?return_url=https%3A%2F%2Fmy.umbc.edu%2F' 
            ;;
        bank)
            local sites='https://www.firstfinancial.org/
                https://www.schwab.com/public/schwab/nn/login/login.html&lang=en'
            ;;
        fin)
            setxkbmap fi
            echo "Switching keyboard..."
            local sites='https://www.suomienglantisanakirja.fi/
                    https://yle.fi/uutiset/osasto/selkouutiset/
                    https://yle.fi/uutiset'
            ;;
        v)
            shift
            tmp=$IFS; IFS='+'
            local sites="https://www.youtube.com/results?search_query=$*"
            IFS=$tmp
            ;;
        *) 
            tmp=$IFS; IFS='+'
            local sites="https://www.google.com/${1:+search?q=$*&oq=$*}"
            IFS=$tmp
            ;;
    esac
    
    (for site in $sites; do 
        chromium-browser "$site" & 
    done)
} &> /dev/null

function dream() {
    echo -e "\n$(date +%D) - "
    while read; do
        echo -e "    ${REPLY}"
    done
    echo 
} >> ~/Docs/dreams.txt

function book() {
    if [[ -z "${1}" ]]; then
        echo
        for book in ~/Docs/school/books/**; do
            [[ "$book" = *.pdf ]] && basename "${book%.pdf}"
        done
        echo
    else
        (evince "$(find ~/Docs/school/books -iname ${1}* | head -1)" &) &> /dev/null
    fi
}

function clean() {
    local before=($(df /dev/sda1 | tail -1))
    rm -rf ~/.cache/chromium/Default ~/.config/chromium/Default/History ~/.config/chromium/Default/Cookies/*
    sudo apt-get autoremove
    sudo apt-get clean
    local after=($(df /dev/sda1 | tail -1))
    echo "Freed $(( ${after[3]} - ${before[3]} )) bytes."
}

function work() {
    cd "${HOME}/Docs/school/work"
    [[ -n "$1" ]] && cd ${1^}*
    ls
}
alias proj="work Soft; cd CMSC*/html; sub *.html css/* js/*"
alias OM="work Soft; cd CMSC*/html; (chromium-browser operationsManager.html &) &> /dev/null"
alias OC="work Soft; cd CMSC*/html; (chromium-browser operationsChief.html &) &> /dev/null"

function py() {
    mv "${1}" "${1%.java}.py" 
}

function cs() {
    cd ${1} && ls
}

function q() {
    echo "New profile?"

    select name in CHROMA APPLE AMBER COMMODORE "IBM Dos"; do 
        ~/Applications/retro-term/cool-retro-term --fullscreen --profile "$name" --workdir "${HOME}/.themes/${name}" &
        break
    done

    exit
}