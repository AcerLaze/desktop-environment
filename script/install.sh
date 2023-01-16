#! /bin/bash

echo "installing environment . . ."

echo "creating backup"
if [[ -f "$HOME/.zshrc" ]]; then
	mv $HOME/.zshrc $HOME/.zshrc.bak
fi

if [[ -f "$HOME/.gitconfig" ]]; then
	mv $HOME/.gitconfig $HOME/.gitconfig.bak
fi

if [[ -f "$HOME/.config/starship.toml" ]]; then
	mv $HOME/.config/starship.toml $HOME/.config/starship.toml.bak
fi

cp -r home/. $HOME

echo "Done"