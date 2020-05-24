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
cat > index.md <<EOL
$out 
EOL
