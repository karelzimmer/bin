#!/bin/bash

# Git status van alle repo's.

readonly -a GIT_REPO=(
    'bin'
    'kz-deb'
    'kz-docs'
    'kz-scripts'
    'kz-uploads'
    'work'
    )
declare -i repo=0

for repo in "${!GIT_REPO[@]}"; do
    printf "$(tput bold)%s$(tput sgr0)\n" "${GIT_REPO[$repo]}"
    cd "$HOME/${GIT_REPO[$repo]}" || exit 1
    git status
    printf '\n'
done

# EOF
