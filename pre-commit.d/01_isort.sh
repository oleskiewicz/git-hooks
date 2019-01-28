#!/bin/sh -e

OPTS="-w 79"

FILES=$(git diff --cached --name-only --diff-filter=ACM | grep '.py$')
[ -z "${FILES}" ] && exit 0

isort -c "${OPTS}" "${FILES}" 2>&1 /dev/null && exit 0

echo >&2 "[isort] sorting imports..."
isort "${OPTS}" "${FILES}"

exit 1
