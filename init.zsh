export ZSH_HOME=${HOME}/.zsh.d

if [ -e $ZSH_HOME/bin ]; then
    export PATH=$ZSH_HOME/bin:$PATH
fi

# ZPlug
export ZPLUG_HOME=${ZSH_HOME}/zplug
source $ZPLUG_HOME/init.zsh

# User extensions
zplug "${ZSH_HOME}/my_ext", from:local, use:"*.zsh"

# Pre-defined
zplug "${ZSH_HOME}/config", from:local, use:"alias.zsh"
zplug "${ZSH_HOME}/config", from:local, use:"autoload.zsh"
zplug "${ZSH_HOME}/config", from:local, use:"general.zsh"
zplug "${ZSH_HOME}/config", from:local, use:"func.zsh"

# OMZ
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# Efficiency
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh

# Dev
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh

# Web
zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh

# Tmux
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh

# MacOS
zplug "plugins/iterm2", from:oh-my-zsh, if:"[[ $OSTYPE == darwin* ]]"
zplug "${ZSH_HOME}/config", from:local, use:"macos.zsh", if:"[[ $OSTYPE == darwin* ]]"

# Python
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh

# Themes
zplug "themes/robbyrussell", from:oh-my-zsh

# Completion
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-completions", use:src
fpath=($ZPLUG_HOME/repos/zsh-users/zsh-completions/src $fpath)

# Fish-shell likes
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo
        zplug install
    else
        echo
    fi
fi

zplug load
