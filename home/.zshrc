# ZSH config
for file in $HOME/.config/zsh/*; do
    source "$file"
done

# Start starship
eval "$(starship init zsh)"


