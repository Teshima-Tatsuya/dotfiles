#!/usr/bin/env bash

## func area

# @return 0 is found, 1 is not found
command_exists() {
    which $1 > /dev/null 1>&2
    return $?
}

download() {
    if command_exists "git"; then
        git clone $GIT_DIR $DOT_DIR
    else
        echo "git command is not exist"
    fi
}

link() {
    cd $DOT_DIR

    for f in .??*
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue

        ln -snf $DOT_DIR/$f $HOME
    done
}

install() {
    if [ "$(uname)" == 'Darwin' ]; then
        pushd $DOT_DIR/installer
    fi
}


## const area
DOT_DIR="$HOME/dotfiles"
GIT_DIR="https://github.com/Teshima-Tatsuya/dotfiles"


## procedure area
download
link
