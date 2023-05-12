#!/bin/bash

fonts_list=(
	font-fira-code-nerd-font
)

brew tap homebrew/cask-fonts

for font in "${fonts_list[@]}"; do
	brew install --cask "$font"
done
exit
