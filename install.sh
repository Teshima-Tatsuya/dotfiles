#!/usr/bin/env bash

## func area

# @return 0 is found, 1 is not found
command_exists() {
    which $1 > /dev/null 1>&2
    return $?
}

link() {
    cd $DOT_DIR

    for f in .??*
    do
        [[ "$f" == ".git" ]] && continue
        [[ "$f" == ".DS_Store" ]] && continue
        [[ "$f" == ".config" ]] && continue

        ln -snf $DOT_DIR/$f $HOME
    done
}

install() {
    if [ "$(uname)" == 'Darwin' ]; then
        pushd $DOT_DIR/installer
    fi
}


## const area
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOT_DIR="$SCRIPT_DIR"


## procedure area
link
ln -snf $DOT_DIR/.config/nvim $HOME/.config
