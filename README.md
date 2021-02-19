# .dotfiles
collection of my dot files with some scripts to install things as easy as possible.

this repo was created based on the course and recommendations of [Patrick McDonald](https://twitter.com/EIEIOxyz) in the udemy course [Dotfiles from Start to Finish-ish](https://www.udemy.com/course/dotfiles-from-start-to-finish-ish/?referralCode=445BE0B541C48FE85276)

## TODO:
- finish the manual install text
- check if FZF works after this installation

## Install using script
1. cd into the repo folder
```
./install
```
2. after that finishes open nvim and install using plug
```
:PlugInstall
```
3. now you can install the CoC.vim extensions with something like:
```
:CocInstall coc-json coc-tsserver coc-css coc-html coc-vetur
```

4. Grab a beer and enjoy.


## Steps to bootstrap a new Mac Manually
1. Install apples command line tools in order to use Git and Homebrew
```
xcode-select --install
```

2. Install OhMyZsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

3. Install iterm from [the official web page](https://iterm2.com/)

4. Clone repo into home folder
```
cd && git clone https://github.com/sebasvelasco353/.dotfiles.git
```

5. Create SymLinks in ~ to the real files in the repo you just created
```
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh
```

6. Install homebrew and then the software needed after thar
```
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Pass the Brewfile
brew bundle --file ~/.dotfiles/Brewfile
```