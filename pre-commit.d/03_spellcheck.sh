#!/bin/sh -e

FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '.tex$')
[ -z "$FILES" ] && exit 0

for f in $FILES
do
	output=$(aspell -x -t list < "$f" | wc -l)
	if [ "$output" -gt 0 ]
	then
		echo "[$0] error: misspelled words:"
		echo "$output"
		exit 1
	fi
done

exit 0
