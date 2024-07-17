# replace ls with exa if exist
if type "exa" >/dev/null; then
  alias ls="exa -lgh --git --icons"
  alias ll="exa -lg --git-ignore --icons"
  alias la="exa -lagh --git --icons"
  alias lt="exa -T"
fi

# replace cat with bat if exist
if type "bat" >/dev/null; then
  alias cat="bat"
fi

# replace vim with neovim if exist
if type "nvim" >/dev/null; then
  alias vi="nvim"
  alias v="nvim"
else
  alias vi="vim"
  alias v="vim"
fi

if type "zoxide" >/dev/null; then
  alias cd="z"
fi

# Utilities
alias sudo="sudo -E "
alias mv="mv -v "
alias rm="rm -v "
alias less="less -R "
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Linux specific aliases
if [[ $(uname) == 'Linux' ]]; then
  alias fixpacman="sudo rm /var/lib/pacman/db.lck"
  alias grubup="sudo update-grub"
  alias jctl="journalctl -p 3 -xb"
fi

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias reload_zsh="source $HOME/.zshrc"
alias git-ls='git ls-files -omdt --exclude-standard'
