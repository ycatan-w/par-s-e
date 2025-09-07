#!/bin/bash

if [[ -d ".git" || "$(git rev-parse --is-inside-work-tree 2> /dev/null)" == "true" ]]; then
  git pull &>/dev/null
  branch="$1"
  if [ -z "$1" ]; then
    branch="$(git branch --show-current)"
    git checkout - &>/dev/null
  fi
  exists=$(git show-ref refs/heads/"$branch")
  if [ -n "$exists" ]; then
    echo 'branch exists locally!'
    cmd="git branch -D $branch"
    echo "> $cmd"
    $cmd
  fi
  exists=$(git show-ref refs/remotes/origin/"$branch")
  if [ -n "$exists" ]; then
    echo 'branch exists remotely!'
    cmd="git push origin :$branch"
    echo "> $cmd"
    $cmd
  fi
fi
