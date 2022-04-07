#!/bin/bash
ZSH_HOME=${HOME}/.zsh.d

if [ ! -e $ZSH_HOME/bin ]; then
    mkdir -p $ZSH_HOME/bin
    cp .zsh.d/bin/* $ZSH_HOME/bin
fi

echo "Download zplug"
if [ ! -e $ZSH_HOME/zplug ]; then
    git clone https://github.com/zplug/zplug.git $ZSH_HOME/zplug
else
    echo "$ZSH_HOME/zplug existed, skip"
fi

echo "Download on-my-zsh"
if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
else
    echo "$HOME/.oh-my-zsh existed, skip"
fi

if [ ! -e $HOME/.zshrc ]; then
    cp .zshrc $HOME/.zshrc
else
    echo "$HOME/.zshrc existed, skip"
fi

if [ ! -e $ZSH_HOME/zplug_loader.sh ]; then
    cp .zsh.d/zplug_loader.sh $ZSH_HOME
else
    echo "$ZSH_HOME/zplug_loader.sh existed, skip"
fi

if [ ! -e $ZSH_HOME/my_profile ]; then
    cp .zsh.d/my_profile $ZSH_HOME
else
    echo "$ZSH_HOME/my_profile existed, skip"
fi

echo """Change the default shell as zsh:

On Linux:
  sudo chsh --shell=$(which zsh) $USER

On Mac OS X:
  sudo chsh -s /bin/zsh $USER
"""

echo "Installed successfully."