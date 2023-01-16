ZSH_PLUGIN_PATH="/usr/share/zsh/plugins"

if type "brew" > /dev/null; then
    ZSH_PLUGIN_PATH="/opt/homebrew/share"
fi

source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-autosuggestion config

export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

