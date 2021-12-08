set fish_greeting
cat ~/.cache/wal/sequences
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end
abbr -a -g si sudo snap install 
abbr -a -g ai sudo apt install 
abbr -a -g au 'sudo apt update && sudo apt upgrade -y && sudo snap refresh'


if status is-interactive
	set fish_greeting
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo -ne '\033k'
    echo -ne $argv
    echo -ne '\033\\'
    tput setaf 6; echo -ne $PWD
    echo -e ""
    echo (date +%H:%M:%S)\>
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.bash ] && . ~/.config/tabtab/__tabtab.bash || true

set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $PATH $NPM_PACKAGES/bin

set MANPATH $NPM_PACKAGES/share/man $MANPATH
