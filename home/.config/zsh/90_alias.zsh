# replace ls with exa if exist
if type "exa" > /dev/null; then
    echo "exa found !"
    alias ls="exa -lgh --git --icons"
    alias ll="exa -lg --git-ignore --icons"
    alias la="exa -lagh --git --icons"
    alias lt="exa -T"
fi

# replace cat with bat if exist
if type "bat" > /dev/null; then
    alias cat="bat"
fi

# replace vim with neovim if exist
if type "nvim" > /dev/null; then
    alias vi="nvim"
    alias v="nvim"
fi

alias sudo="sudo "

# Utilities
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias grubup="sudo update-grub"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias jctl="journalctl -p 3 -xb"

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias reload_zsh="source $HOME/.zshrc"

alias git-clear-branch="git branch -d $(git branch -l | grep -v "\*.*")"
