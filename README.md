# .dotfiles
---

collection of my dot files.

## Steps to bootstrap a new Mac
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