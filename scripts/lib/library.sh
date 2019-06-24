#!/bin/bash

# Import Dependencies
. ./scripts/lib/utilities.sh
. ./scripts/lib/sfdx.sh
. ./scripts/lib/git.sh

init_scratch_org () {
  alias=$1
  configPath=$2
  dataPath=$3
  permsetName=$4
  duration=${5:-10}

  delete_org $alias
  create_org $alias $duration $configPath
  source_push $alias
  data_import $alias $dataPath
  assign_permset $alias $permsetName
}

convert_deploy_mdtapi () {
  outputRoot=${2:-mdtapi}
  pkgName=${3:-unpackaged}
  srcRoot=${4:-main}

  convert_mdtapi $srcRoot $outputRoot $pkgName
  deploy_mdtapi $1 $outputRoot $pkgName

  rm -rf $outputRoot
}

init_feature_branch () {
  branchName=$(prompt_string "Enter Feature Name")
  create_feature_branch $branchName
}

pull_and_commit () {
  alias=$(prompt_string "Enter Scratch Org Name")
  commitMessage=$(prompt_string "Enter Commit Message")
  source_pull $alias
  commit $commitMessage
}