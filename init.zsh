export ZSH_HOME=${HOME}/.zsh.d

if [ -e $ZSH_HOME/config/zplug_loader.zsh ]; then
    source $ZSH_HOME/config/zplug_loader.zsh
fi

if [ -e $ZSH_HOME/.profile ]; then
    source $ZSH_HOME/.profile
fi

if [ -e $ZSH_HOME/.zprofile ]; then
    source $ZSH_HOME/.zprofile
fi

if [ -e $ZSH_HOME/my_profile ]; then
    source $ZSH_HOME/my_profile
fi

if [ -e $ZSH_HOME/bin ]; then
    export PATH=$ZSH_HOME/bin:$PATH
fi
