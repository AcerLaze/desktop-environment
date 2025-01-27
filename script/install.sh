#! /bin/bash

echo "installing environment . . ."

OS=$(uname -s)

APP_EXCLUSION=()

if [[ $OS == "Linux" ]]; then
	APP_EXCLUSION=("skhd", "yabai")
fi

BASE_DIR=$(git rev-parse --show-toplevel)/home

if [[ -L $HOME/.zshrc ]]; then
	echo ".zshrc already setup skipping!"
elif [[ -f "$HOME/.zshrc" ]]; then
	mv $HOME/.zshrc $HOME/.zshrc.local
	ln -s $BASE_DIR/.zshrc $HOME/.zshrc
else
	ln -s $BASE_DIR/.zshrc $HOME/.zshrc
fi

if [[ -f "$HOME/.gitconfig" ]]; then
	echo "Ignoring .gitconfig since it may contains credentials"
else
	cp $BASE_DIR/.gitconfig $HOME/.gitconfig
fi

HOME_CONFIG_DIR=$HOME/.config

installConfig() {
	appName=$1
	path=$2

	if [[ -L $HOME_CONFIG_DIR/$path ]]; then
		echo "$appName already installed, skipping"
		return
	fi

	if [[ -d $HOME_CONFIG_DIR/$path ]] || [[ -f $HOME_CONFIG_DIR/$path ]]; then
		mv $HOME_CONFIG_DIR/$path $HOME_CONFIG_DIR/$path.bak
	fi

	ln -s $BASE_DIR/.config/$path $HOME_CONFIG_DIR/$path
}

for file in $BASE_DIR/.config/*; do
	FILE_NAME=$(basename $file)
	CONFIG_PATH=$FILE_NAME

	if [[ $(echo "${APP_EXCLUSION[@]}" | grep -F $FILE_NAME) ]]; then
		continue
	fi

	if [[ $FILE_NAME == Code ]]; then
		CONFIG_PATH=Code/User/settings.json
	fi

	installConfig $FILE_NAME $CONFIG_PATH
done

echo "Done"
