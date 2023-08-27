#!/usr/bin/bash
if [ "$#" == 0 ]; then
    echo "$#"
    echo "Error: Atleast one argument is required. Which is the path to the git repository."
    exit 1
elif [ ! -d $1 ]; then
    echo "Error: The path provided is not a directory."
    exit 1
elif [ ! -d $1/.git ]; then
    echo "Error: The directory provided is not a git repository."
    exit 1
elif [ $# == 1 ]; then
    cd $1
    git shortlog -sn --all >../result.txt
else
    cd $1
    for arg in "$@"; do
        git shortlog -sn --all | grep "$arg" >>../result.txt
    done
fi
