#!/bin/bash

#install zsh if not found
if which zsh > /dev/null; then
	/bin/zsh install_zsh.sh
else
	if which yaourt > /dev/null; then
		sudo yaourt -S zsh
		/bin/zsh install_zsh.sh
	elif which pacman > /dev/null; then
		sudo pacman -S zsh
		/bin/zsh install_zsh.sh
	else
		echo "Maybe you are under another distribution than Arch, Switch!"
	fi
fi


