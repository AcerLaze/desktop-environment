# ZSH config
for file in $HOME/.config/zsh/*; do
  source "$file"
done

# Initialize starship
if type starship > /dev/null; then
  eval "$(starship init zsh)"
fi

# Initialize zoxide
if type zoxide > /dev/null; then
  eval "$(zoxide init zsh)"
fi