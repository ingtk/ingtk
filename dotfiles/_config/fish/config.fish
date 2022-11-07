if status is-interactive
	eval (/opt/homebrew/bin/brew shellenv)
end

set -x VOLTA_HOME "$HOME/.volta"
set -x PATH "$VOLTA_HOME/bin" $PATH
set -x PATH "$HOME/development/flutter/bin" $PATH
set -Ux fish_user_paths $HOME/.anyenv/bin $fish_user_paths

alias ls exa
alias cat bat
alias vim nvim

abbr -a cdr "cd (ghq root)/(ghq list | peco)"
abbr -a push "git push origin (git symbolic-ref --short HEAD)"
abbr -a pull "git pull origin (git symbolic-ref --short HEAD)"
abbr -a tigs "tig status"
abbr -a gco "git checkout"
abbr -a gf "git fetch"
abbr -a gfp "git fetch -p"

direnv hook fish | source
anyenv init - fish | source
starship init fish | source
zoxide init fish | source

set -x GOPATH $HOME/go
