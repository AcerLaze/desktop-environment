ZSH_PLUGIN_PATH="/usr/share/zsh/plugins"
if type "brew" > /dev/null; then
    ZSH_PLUGIN_PATH="/opt/homebrew/share"
fi

# zsh syntax highlighting plugin
if [[ -d $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
	source $ZSH_PLUGIN_PATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# zsh auto suggestion plugin
if [[ -d $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
	source $ZSH_PLUGIN_PATH/zsh-autosuggestions/zsh-autosuggestions.zsh
	export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
fi
