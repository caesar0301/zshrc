# golang
export GOPATH=${HOME}/go
export PATH=$GOPATH/bin:$PATH
export GO111MODULE=on
export GOPROXY=https://mirrors.aliyun.com/goproxy/,direct

# pyenv
if [ -e "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    if command -v pyenv 1>/dev/null 2>&1; then
        # Load pyenv automatically
        eval "$(pyenv init --path)"
        # Load pyenv-virtualenv automatically
        eval "$(pyenv virtualenv-init -)"
    fi
fi

# Rust
if command -v rustc &>/dev/null; then
    export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
    export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
fi

# Cargo
if command -v cargo &>/dev/null; then
    if [ -e "$HOME/.cargo" ]; then
        export PATH="$HOME/.cargo/bin":$PATH
    fi
fi

# jenv
if command -v jenv &>/dev/null && [ -e "$HOME/.jenv" ]; then
    export PATH="$HOME/.jenv/bin:$PATH"
    eval "$(jenv init -)"
fi

# rbenv
if command -v rbenv &>/dev/null && [ -e "$HOME/.rbenv" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init - zsh)"
fi

# cuda
if [ -e "/usr/local/cuda" ]; then
    export PATH="/usr/local/cuda/bin$PATH"
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
fi
