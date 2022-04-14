#-- function utilities for daily usage

# start or access tmux dev session
function bingo() {
    unset TMUX
    tmux start-server
    tmux has-session -t dev
    if [ $? != 0 ]; then
        tmux new-session -d -s dev
    fi
    tmux attach -t dev
}

# Prune all docker junk data
function docker_prune_all() {
    y | docker container prune
    y | docker image prune
    y | docker volume prune
}

# Remove deleted file from git cache
function gitrmdeleted() {
    FILES=$(git ls-files -d)
    if [[ ! -z $FILES ]]; then
        git rm $FILES
    else
        echo "No deleted files"
    fi
}

# Remove git submodule
function gitrmsubmod() {
    SUBMODULE=$1
    git submodule deinit -f -- $SUBMODULE
    rm -rf .git/modules/$SUBMODULE
    git rm -f $SUBMODULE
}
