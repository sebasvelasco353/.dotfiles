#!/usr/bin/env zsh
echo "\n <<< Starting Xcode Setup >>>\n"
xcode-select --install

echo "\n <<< Starting OhMyZsh install >>>\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
