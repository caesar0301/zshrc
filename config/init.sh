export ZSH_HOME=${HOME}/.zsh.d

if [ -e $ZSH_HOME/config/zplug_loader.sh ]; then
    source $ZSH_HOME/config/zplug_loader.sh
fi

if [ -e $ZSH_HOME/config/alias.sh ]; then
    source $ZSH_HOME/config/alias.sh
fi

if [ -e $ZSH_HOME/my_profile ]; then
    source $ZSH_HOME/my_profile
fi

if [ -e $ZSH_HOME/bin ]; then
    export PATH=$ZSH_HOME/bin:$PATH
fi

autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv
autoload -U compinit && compinit
