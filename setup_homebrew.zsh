#!/usr/bin/env zsh
echo "\n <<< Starting Homebrew Setup >>>\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\n <<< Installing stuff with Homebrew >>>\n"
# Tools installation
brew install node
brew install hhtpie
brew install neovim

# App installations
brew install --cask google-chrome
