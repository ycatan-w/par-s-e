#!/bin/sh

if [[ -d ".git" || "$(git rev-parse --is-inside-work-tree 2> /dev/null)" == "true" ]]; then
  branch="$(git branch --show-current)"
  cmd="git push origin $branch -uf"
  echo "> $cmd"
  $cmd
fi
