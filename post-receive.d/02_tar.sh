#!/bin/sh -e

_pack() {
	git archive --format tar --prefix "$1/" "$1" | gzip -9 > "$2"
}

src="$(basename $(pwd) '.git')"
dst="/var/www/pub.oleskiewi.cz/src/$src"
mkdir -p "$dst"

_pack "HEAD" "${dst}/${src}-HEAD.tar.gz"

for t in $(git tag -l)
do
	f="${dst}/${src}-${t}.tar.gz"
	[ -f "$f" ] || _pack "$t" "$f"
done
