setopt autocd
setopt extendedglob
setopt correct
setopt hist_ignore_all_dups

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt appendhistory

autoload -Uz compinit
compinit
