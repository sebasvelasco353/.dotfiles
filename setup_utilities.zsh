#!/usr/bin/env zsh

echo "\n <<< Starting Xcode Setup >>>\n"
xcode-select --install

echo "\n <<< Starting OhMyZsh install >>>\n"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "\n <<< Installing the powerlevel10k theme for OhMyZsh >>>\n"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo "\n <<< Starting Homebrew Setup >>>\n"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "\n <<< Installing stuff with Homebrew >>>\n"
brew bundle --verbose

echo "\n <<< Starting Vim Setup >>>\n"
mv ~/init.vim ~/.config/nvim/init.vim

echo "\n <<< Starting Vim Startup screen setup >>>\n"
mv ~/start-screen.vim ~/.config/nvim/plug-config/start-screen.vim

echo "\n <<< Moving coc-config file to .config >>> \n "
mv ~/coc-settings.json ~/.config/nvim/coc-settings.json

echo "\n <<< Moving coc.vim file to .config/nvim/plug-config >>> \n "
mv ~/coc.vim ~/.config/nvim/plug-config/coc.vim
echo "\n <<< moved the files! >>>\n"

echo "\n <<< Installing Vim-Plug (Plugin manager) >>>\n"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

