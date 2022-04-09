#!/bin/bash
ZSH_HOME=${HOME}/.zsh.d

cd $ZSH_HOME

echo "Download on-my-zsh"
if [ ! -e $HOME/.oh-my-zsh ]; then
    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh
else
    echo "$HOME/.oh-my-zsh existed, skip"
fi

if [ ! -e $HOME/.zshrc ]; then
    cp default.zshrc $HOME/.zshrc
else
    echo "$HOME/.zshrc existed, skip"
fi

echo """Change the default shell as zsh:

On Linux:
  sudo chsh --shell=$(which zsh) $USER

On Mac OS X:
  sudo chsh -s /bin/zsh $USER
"""

echo "Installed successfully."
