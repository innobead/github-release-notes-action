#!/bin/sh -l

IFS='/' read -r username repository <<EOF
$GITHUB_REPOSITORY
EOF

tag_name="${GITHUB_REF##*/}"
GREN_GITHUB_TOKEN=$GITHUB_TOKEN gren release -d --username="$username" --repo="$repository" --tags="${tag_name}"

changelog=$(cat ./CHANGELOG.md)
echo "::set-output name=changelog::${changelog}"
