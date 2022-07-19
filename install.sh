#!/usr/bin/env bash

## func area

# @return 0 is found, 1 is not found
command_exists() {
    which $1 > /dev/null 1>&2
    return $?
}

download() {
    if command_exists "git"; then
        git clone $GIT_DIR
    else
        echo "git command is not exist"
    fi
}

link() {
    DIR=$(cd $(dirname $0); pwd)

    for f in .??*
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue

        ln -sf $DIR/$f ~/$f
    done
}


## const area
DOT_DIR="$HOME/dotfiles"
GIT_DIR="https://github.com/Teshima-Tatsuya/dotfiles"


## procedure area
download
link