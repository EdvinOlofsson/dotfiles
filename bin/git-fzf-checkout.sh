#!/usr/bin/env bash

fzf() {
    fzf-tmux -d 50% -- "$@"
}

# checkout git branch/tag

if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
    exit 1
fi

tags=$(git tag \
    | awk '{print "\x1b[38;5;172mtag\x1b[m\t" $1}') \
    || exit 1

branches=$(git branch --all \
    | grep -v HEAD \
    | sed 's#.* ##' \
    | grep -v 'remotes/' \
    | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') \
    || exit 1

target=$(fzf +s +m +e --ansi -d '\t' -n 2 <<< "$branches\n$tags") || exit 1
# target=$(fzf +s +m +e --ansi -d '\t' -n 2 <<< "$branches") || exit 1

git checkout "$@" "$(awk '{print $2}' <<< "$target")"
