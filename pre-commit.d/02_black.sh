#!/bin/sh

OPTS="-l 79 --py36"

FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '.py$')
[ -z "${FILES}" ] && exit 0

black "${OPTS}" --check --quiet "${FILES}" && exit 0

echo >&2 "[black] formatting files..."
black "${OPTS}" "${FILES}"

exit 1
