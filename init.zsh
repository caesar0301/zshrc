export ZSH_HOME=${HOME}/.zsh.d

if [ -e $ZSH_HOME/bin ]; then
    export PATH=$ZSH_HOME/bin:$PATH
fi

# zsh bundled
autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv
autoload -U compinit && compinit

# ZPlug
export ZPLUG_HOME=${ZSH_HOME}/zplug
source $ZPLUG_HOME/init.zsh

# OMZ
zplug "robbyrussell/oh-my-zsh", use:"lib/*.zsh"

# Efficiency
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/cp", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "plugins/vi-mode", from:oh-my-zsh
zplug "plugins/fzf", from:oh-my-zsh
zplug "plugins/z", from:oh-my-zsh
zplug "plugins/dirhistory", from:oh-my-zsh

# Colored
zplug "plugins/colored-man-pages", from:oh-my-zsh

# Dev
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/gitignore", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh

# Share
zplug "plugins/transfer", from:oh-my-zsh

# Web
zplug "plugins/web-search", from:oh-my-zsh
zplug "plugins/urltools", from:oh-my-zsh

# Tmux
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/tmuxinator", from:oh-my-zsh

# MacOS
zplug "plugins/macos", from:oh-my-zsh, if:"[[ $OSTYPE == darwin* ]]"
zplug "plugins/brew", from:oh-my-zsh, if:"[[ $OSTYPE == darwin* ]]"
zplug "plugins/iterm2", from:oh-my-zsh, if:"[[ $OSTYPE == darwin* ]]"
zplug "${ZSH_HOME}/config/macos", from:local, use:"macos.zsh", if:"[[ $OSTYPE == darwin* ]]"

# Python
zplug "plugins/pyenv", from:oh-my-zsh
zplug "plugins/virtualenv", from:oh-my-zsh

# Themes
if command -v starship &>/dev/null; then
    if [[ $OSTYPE == darwin* ]]; then
        export STARSHIP_CONFIG=$ZSH_HOME/starship/macos.toml
    else
        export STARSHIP_CONFIG=$ZSH_HOME/starship/basic.toml
    fi
    eval "$(starship init zsh)"
else
    zplug "plugins/themes", from:oh-my-zsh
    zplug "themes/robbyrussell", from:oh-my-zsh
fi

# Completion
zplug "plugins/history-substring-search", from:oh-my-zsh
zplug "zsh-users/zsh-completions", use:src
fpath=($ZPLUG_HOME/repos/zsh-users/zsh-completions/src $fpath)

# Fish-shell likes
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh
zplug "zsh-users/zsh-syntax-highlighting", use:zsh-syntax-highlighting.zsh

# Pre-defined configs
zplug "${ZSH_HOME}/config", from:local, use:"basic.zsh"
zplug "${ZSH_HOME}/config", from:local, use:"alias.zsh"
zplug "${ZSH_HOME}/config", from:local, use:"func.zsh"
zplug "${ZSH_HOME}/config", from:local, use:"devtools.zsh"

# User extensions
zplug "${ZSH_HOME}/my_ext", from:local, use:"*.sh"
zplug "${ZSH_HOME}/my_ext", from:local, use:"*.zsh"

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo
        zplug install
    else
        echo
    fi
fi

zplug load
