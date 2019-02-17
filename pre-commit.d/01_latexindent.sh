#!/bin/sh -e
OPTS="-m"

FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '.tex$')
[ -z "${FILES}" ] && exit 0

TMPDIR=$(mktemp -d)
mkdir -p "$TMPDIR"
trap 'rm -r ${TMPDIR}' EXIT 

for FILE in ${FILES}; do
	latexindent "${OPTS}" "${FILE}" > "$TMPDIR/$FILE"
	diff "$TMPDIR/$FILE" "$FILE"  > /dev/null 2>&1 || {
			echo >&2 "[latexindent] formatted $FILE"
			mv "$TMPDIR/$FILE" "$FILE"
			exit 1
	}
done

exit 0
