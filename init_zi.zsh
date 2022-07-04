zi_home="${ZSH_RUNTIME}/zi"
source "${zi_home}/zi.zsh"

autoload -Uz _zi
(( ${+_comps}  )) && _comps[zi]=_zi

# Pre-defined
zi snippet ${ZSH_RUNTIME}/ext/pre.zsh
if [[ $OSTYPE == darwin*  ]]; then
    zi snippet ${ZSH_RUNTIME}/ext/macos/macos_pre.zsh
fi

# OMZ libs
zi snippet OMZL::clipboard.zsh
zi snippet OMZL::compfix.zsh
zi snippet OMZL::completion.zsh
zi snippet OMZL::correction.zsh
zi snippet OMZL::directories.zsh
zi snippet OMZL::functions.zsh
zi snippet OMZL::git.zsh
zi snippet OMZL::spectrum.zsh
zi snippet OMZL::theme-and-appearance.zsh

if [[ $OSTYPE == darwin*  ]]; then
    zi snippet OMZP::brew
    zi snippet OMZP::iterm2
fi

# Efficiency
zi snippet OMZP::alias-finder
zi snippet OMZP::cp
zi snippet OMZP::extract
zi snippet OMZP::vi-mode
#zi snippet OMZP::fzf
zi snippet OMZP::dirhistory

zi ice pick"z.sh"
zi load rupa/z

# Colored
zi snippet OMZP::colored-man-pages

# Dev
zi snippet OMZP::git
zi snippet OMZP::gitignore
zi snippet OMZP::mvn

# Share
zi snippet OMZP::transfer

# Web
zi snippet OMZP::web-search
zi snippet OMZP::urltools

# Tmux
zi snippet OMZP::tmux
zi snippet OMZP::tmuxinator

# Python
zi snippet OMZP::pyenv
zi snippet OMZP::virtualenv

# Themes
if command -v starship &>/dev/null; then
    if [[ $OSTYPE == darwin* ]]; then
        export STARSHIP_CONFIG=$ZSH_HOME/starship/macos.toml
    else
        export STARSHIP_CONFIG=$ZSH_HOME/starship/basic.toml
    fi
    eval "$(starship init zsh)"
else
    zi cdclear -q
    setopt promptsubst
    zi snippet OMZT::robbyrussell
    zi snippet OMZP::themes
fi

# Completion
zi ice pick"zsh-history-substring-search.zsh"
zi load zsh-users/zsh-history-substring-search

zi ice pick"src"
zi load zsh-users/zsh-completions
fpath=($HOME/.zi/plugins/zsh-users---zsh-completions/src $fpath)

# Fish-shell likes
zi ice pick"zsh-autosuggestions.zsh"
zi load zsh-users/zsh-autosuggestions
zi ice pick "zsh-syntax-highlighting.zsh"
zi load zsh-users/zsh-syntax-highlighting

# My extensions
zi snippet ${ZSH_RUNTIME}/ext/alias.zsh
zi snippet ${ZSH_RUNTIME}/ext/func.zsh
zi snippet ${ZSH_RUNTIME}/ext/devtools.zsh

if [[ $OSTYPE == darwin*  ]]; then
    zi snippet ${ZSH_RUNTIME}/ext/macos/macos.zsh
fi

for i in `find ${ZSH_RUNTIME}/my_ext -maxdepth 1 -type f -name "*.ext.zsh"`; do
    zi snippet $i
done

