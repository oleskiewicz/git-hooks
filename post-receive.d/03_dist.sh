#!/bin/sh -e

src="$(basename $(pwd) '.git')"
dst="$HOME/tmp/$src"

rm -r $dst
mkdir -p $dst
git archive -o $dst/$src.tar "HEAD"
cd $dst
tar -xf $src.tar
make && make dist
