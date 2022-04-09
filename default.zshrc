# filename: .zshrc
export ZSH_HOME=${HOME}/.zsh.d

if [ -e $ZSH_HOME/zplug_loader.sh ]; then
    source $ZSH_HOME/zplug_loader.sh
fi

if [ -e $HOME/bin ]; then
    export PATH=$HOME/bin:$PATH
fi

if [ -e $ZSH_HOME/bin ]; then
    export PATH=$ZSH_HOME/bin:$PATH
fi

if [ -e $ZSH_HOME/my_profile ]; then
    source $ZSH_HOME/my_profile
fi

autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv
autoload -U compinit && compinit

# User-defined as following
# Recommended adding to .zsh.d/my_profile
