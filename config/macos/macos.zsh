# check if pyenv is available
# edit: fixed redirect issue in earlier version
function brew() {
    if which pyenv >/dev/null 2>&1; then
        # assumes default location of brew in `/usr/local/bin/brew`
        /usr/bin/env PATH="${PATH//$(pyenv root)\/shims:/}" HOMEBREW_NO_AUTO_UPDATE=1 /usr/local/bin/brew "$@"
    else
        HOMEBREW_NO_AUTO_UPDATE=1 /usr/local/bin/brew "$@"
    fi
}

# Python3
if [[ $(brew --prefix python3) ]]; then
    PYTHON3_HOME=$(brew --prefix python3)
    export PATH=$PYTHON3_HOME/libexec/bin:$PYTHON3_HOME/bin:$PATH
fi

# Enable GNU GCC by default
if [[ $(brew --prefix gcc) ]]; then
    GNU_GCC_HOME=$(brew --prefix gcc)
    export PATH=$GNU_GCC_HOME/bin:$PATH
    if [[ -e "$GNU_GCC_HOME/bin/gcc-12" ]]; then
        GCC_VER="12"
    elif [[ -e "$GNU_GCC_HOME/bin/gcc-11" ]]; then
        GCC_VER="11"
    elif [[ -e "$GNU_GCC_HOME/bin/gcc-10" ]]; then
        GCC_VER="10"
    elif [[ -e "$GNU_GCC_HOME/bin/gcc-9" ]]; then
        GCC_VER="9"
    elif [[ -e "$GNU_GCC_HOME/bin/gcc-8" ]]; then
        GCC_VER="8"
    fi
    if [ "x$GCC_VER" != "x" ]; then
        alias gcc=$GNU_GCC_HOME/bin/gcc-${GCC_VER}
        alias g++=$GNU_GCC_HOME/bin/g++-${GCC_VER}
        export CC=$GNU_GCC_HOME/bin/gcc-${GCC_VER}
        export CXX=$GNU_GCC_HOME/bin/g++-${GCC_VER}
    fi
fi
