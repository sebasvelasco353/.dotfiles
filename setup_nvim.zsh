#!/usr/bin/env zsh

echo "\n <<< Starting Vim Setup >>>\n"
mv ~/.config/init.vim ~/.config/nvim/init.vim
echo "\n <<< moved the file! >>>\n"

echo "\n <<< Installing Vim-Plug (Plugin manager) >>>\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'