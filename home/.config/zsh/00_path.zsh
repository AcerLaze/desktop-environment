
# Add homebrew path if exist
if [[ -d "/opt/homebrew/bin" ]] then
	export BREW_PATH="/opt/homebrew/bin"
	export PATH="$PATH:$BREW_PATH"
fi

export WORKSPACE="$HOME/workspace"
export ZSH_CONFIG="$HOME/.config/zsh"
