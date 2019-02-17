#!/bin/sh -ex

dst="/var/www/html/pub.oleskiewi.cz/releases"
mkdir -p "$dst"

for t in $(git tag -l)
do
	f="$dst/$(basename $(pwd) '.git')-${t}.tar.gz"
	[ -f "$f" ] ||     \
	git archive        \
		--format tar   \
		--prefix "$t/" \
		"${t}" |       \
	gzip -9 > "$f"
done
