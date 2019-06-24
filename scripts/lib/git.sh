#!/bin/bash

create_feature_branch () {
  git checkout develop
  git checkout -b feature/$1
  git push -u origin feature/$1
}

commit () {
  message=${1:-Auto Commit}

  git status
  git add -A
  git commit -m $message
  git push
}