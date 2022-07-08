# filename: .zshrc
export ZSH_RUNTIME=${HOME}/.zsh_runtime

# Controls
PLUG_MAN="zi"
PROFILE_PERF=0

# Diagnose perf
if [[ ${PROFILE_PERF} == 1 ]]; then
    zmodload zsh/zprof
fi

# zsh bundled
autoload -U parseopts
autoload -U zargs
autoload -U zcalc
autoload -U zed
autoload -U zmv
autoload -U compinit && compinit

if [ -e ${ZSH_RUNTIME}/bin ]; then
    export PATH=${ZSH_RUNTIME}/bin:$PATH
fi

if [[ -e ${ZSH_RUNTIME}/init/init_${PLUG_MAN}.zsh ]]; then
    source ${ZSH_RUNTIME}/init/init_${PLUG_MAN}.zsh
fi

if [[ ${PROFILE_PERF} == 1 ]]; then
    zprof
fi

# User-defined as following
