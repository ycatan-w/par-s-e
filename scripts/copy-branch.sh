#!/bin/bash

if [[ -d ".git" ]] || [[ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" == "true" ]]; then
  branch="$(git branch --show-current)"
  echo "$branch" | tr -d '\n' | pbcopy
  echo "- \033[93m$branch\033[00m copied to clipboard"
fi
