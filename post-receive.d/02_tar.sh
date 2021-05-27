#!/bin/sh -e

src="$(basename "$(pwd)" '.git')"
dst="/var/www/pub.oleskiewi.cz/$src"
mkdir -p "$dst"

for t in $(git tag -l)
do
        f="${dst}/${src}-${t}.tar.gz"
        [ -f "$f" ] || git archive --format tar --prefix "$t/" "$t" | gzip -9 > "$f"
done
