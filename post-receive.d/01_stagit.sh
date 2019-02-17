#!/bin/sh -ex

export LC_CTYPE="en_US.UTF-8"

src="$(pwd)"
dst="/var/www/html/src.oleskiewi.cz/$(basename '$(pwd)' '.git')"

mkdir -p "$dst" && \
cd "$dst"       && \
stagit "$src"   && \
stagit-index "$(dirname $src)" > "$(dirname $dst).index.html"
