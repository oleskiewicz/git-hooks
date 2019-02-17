#!/bin/sh -e

export LC_CTYPE="en_US.UTF-8"

src="$(pwd)"
dst="/var/www/src.oleskiewi.cz"
repo="$(basename $src '.git')"

mkdir -p "$dst/$repo"
cd "$dst/$repo"
ln -sf "$dst/style.css" "$dst/$repo"
ln -sf "$dst/logo.png" "$dst/$repo"
stagit -l 30 "$src"
stagit-index "$src"/../*.git > "$dst/index.html"
