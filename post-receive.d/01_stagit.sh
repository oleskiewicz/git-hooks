#!/bin/sh -e

export LC_CTYPE="en_US.UTF-8"

src="$(pwd)"
dst="/var/www/src.oleskiewi.cz"
repo="$(basename $src '.git')"

mkdir -p "$dst/$repo"                && \
cd "$dst/$repo"                      && \
ln -sf "$dst/style.css" "$dst/$repo" && \
stagit "$src"                        && \
stagit-index "$src"/../*.git > "$dst/index.html"
