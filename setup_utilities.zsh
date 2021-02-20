#!/usr/bin/env zsh

echo "\n <<< Starting Xcode Setup >>>\n"
xcode-select --install

echo "\n <<< Starting OhMyZsh install >>>\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\n <<< Starting Homebrew Setup >>>\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\n <<< Installing stuff with Homebrew >>>\n"
brew bundle --verbose

echo "\n <<< Starting Vim Setup >>>\n"
mv ~/init.vim ~/.config/nvim/init.vim
echo "\n <<< moved the file! >>>\n"

echo "\n <<< Installing Vim-Plug (Plugin manager) >>>\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
