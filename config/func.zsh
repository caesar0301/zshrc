#-- function utilities for daily usage

# start or access tmux dev session
function bingo {
    unset TMUX
    tmux start-server
    tmux has-session -t dev
    if [ $? != 0 ]; then
        tmux new-session -d -s dev
    fi
    tmux attach -t dev
}

# Prune all docker junk data
function docker_prune_all {
    y | docker container prune
    y | docker image prune
    y | docker volume prune
}

# Remove deleted file from git cache
function gitrmdeleted {
    FILES=$(git ls-files -d)
    if [[ ! -z $FILES ]]; then
        git rm $FILES
    else
        echo "No deleted files"
    fi
}

# Remove git submodule
function gitrmsubmod {
    SUBMODULE=$1
    git submodule deinit -f -- $SUBMODULE
    rm -rf .git/modules/$SUBMODULE
    git rm -f $SUBMODULE
}

# Docker image tag generator
function genimgver {
    TAG="${1:-notag}"
    MODE="${2:-release}"
    echo ${MODE}_$(date +"%Y%m%d%H%M%S")_${TAG}_$(git rev-parse HEAD | head -c 8)
}

# Open file window
function openw {
    KNAME=$(uname -s)
    KREL=$(uname -r)
    EXE='nautilus'
    if [[ $KNAME == "Linux" ]]; then
        if [[ $KREL =~ "microsoft-standard" ]]; then
            EXE='explorer.exe'
        fi
    elif [[ $KNAME == "Darwin"  ]]; then
        EXE='open'
    fi
    $EXE $@
}

# Proxy triggers
function enableProxy {
    export OLD_PROMPT="$PROMPT"
    PROXY_IP="127.0.0.1"
    if [[ $(uname -r) =~ "microsoft-standard" ]]; then
        PROXY_IP=$(/mnt/c/Windows/system32/ipconfig.exe /all |
            sed -n -E "s|.*IPv4 Address.*([0-9]{3}(\.[0-9]*){3})\(Preferred\)|\1|p" |
            grep 192 |
            tr -d '\r\n\t[:blank:]')
    fi
    export http_proxy="http://${PROXY_IP}:7890"
    export https_proxy="http://${PROXY_IP}:7890"
    export all_proxy="socks5://${PROXY_IP}:7890"
    export PROMPT="[P] $PROMPT"
}

function disableProxy {
    export PROMPT=$OLD_PROMPT
    unset http_proxy
    unset https_proxy
    unset OLD_PROMPT
}

# Set local header and libs
function enablePrefixLocal {
    export OLD_LP_PATH=$PATH
    export OLD_LP_LDPATH=$LD_LIBRARY_PATH
    export OLD_LP_CINCLUDE=$C_INCLUDE_PATH
    export OLD_LP_CPPINCLUDE=$CPLUS_INCLUDE_PATH

    export PATH=$HOME/.local/bin:$PATH
    export LD_LIBRARY_PATH=$HOME/.local/lib64:$HOME/.local/lib:$LD_LIBRARY_PATH
    export C_INCLUDE_PATH=$HOME/.local/include:$C_INCLUDE_PATH
    export CPLUS_INCLUDE_PATH=$HOME/.local/include:$CPLUS_INCLUDE_PATH
}

function disablePrefixLocal {
    export PATH=$OLD_LP_PATH
    export LD_LIBRARY_PATH=$OLD_LP_LDPATH
    export C_INCLUDE_PATH=$OLD_LP_CINCLUDE
    export CPLUS_INCLUDE_PATH=$OLD_LP_CPPINCLUDE
}

