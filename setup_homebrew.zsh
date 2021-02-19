#!/usr/bin/env zsh
echo "\n <<< Starting Homebrew Setup >>>\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Tools installation
echo "\n <<< Installing stuff with Homebrew >>>\n"
brew bundle --verbose