#!/bin/bash

function getPostHeader() {
    HEADER="
---\ntitle: $1\ndate: '$(date +"%F")'\nspoiler: $2.\ncta: '$3'\n---\n
"
    echo -e $HEADER
}

function getDirName() {
    blogname=$@
    blogname=${blogname//' '/-}
    echo "$blogname" | tr '[:upper:]' '[:lower:]'
}

function runCreate() {
    read -p "Post title:    " title
    read -p "Cta:   " cta
    read -p "Spoiler:   " spoiler
    cd src/pages
    post_dir=$(getDirName ${title})
    echo $post_dir
    mkdir "$post_dir"
    cd $post_dir
    touch index.md
    out=$(getPostHeader "${title}" "${spoiler}" "${cta}")
    cat >index.md <<EOL
$out 
EOL
}

function runDelete() {
    cd src/pages
    rm -rf "$@"
}

function list() {
    cd src/pages
    echo */
}

# Commands
# 1. blog create
# 2. blog list
# 3. blog remove name

function init() {
    action=$2
    if [ "$#" -eq 2 ]; then
        if [ $action = 'list' ]; then
            list
        elif [ $action = 'create' ]; then
            runCreate
        fi
    elif [ "$#" -eq 3 ]; then
        to_delete=$3
        if [ $action = 'remove' ]; then
            if [ -n $to_delete ]; then
                $(runDelete ${to_delete})
            else echo "Nothing to delete"
            fi
        fi
    fi

}

init $@
