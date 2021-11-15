set fish_greeting
cat ~/.cache/wal/sequences || true

if status is-interactive
	set fish_greeting
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    echo -ne '\033k'
    echo -ne $argv
    echo -ne '\033\\'
    echo -ne $PWD
    echo -e ""
    echo -n \[\$(date +%H:%M:%S)\]\ '$ '
end

set NPM_PACKAGES "$HOME/.npm-packages"

set PATH $PATH $NPM_PACKAGES/bin

set MANPATH $NPM_PACKAGES/share/man $MANPATH

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
