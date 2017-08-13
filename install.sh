#!/bin/bash

DIR=$(cd $(dirname $0); pwd)

for f in .??*
do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".DS_Store" ]] && continue

    ln -sf $DIR/$f ~/$f
done
