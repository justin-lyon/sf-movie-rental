#!/bin/bash

get_info () {
  sfdx --version
  sfdx plugins --core
  sfdx force:org:list
}

web_login () {
  hubName=${1:-"DevHub"}
  sfdx force:auth:web:login -d -a $1
}

delete_org () {
  echo "*** Removing old scratch org, $1"
  sfdx force:org:delete -p -u $1
}

create_org () {
  duration=${2:-10}
  echo "*** Creating scratch Org. Alias: $1, for $duration days."
  sfdx force:org:create -s -a "$1" -d $duration -f "$3"
}

source_push () {
  echo "*** Pushing metadata to $1"
  sfdx force:source:push -u $1
}

source_pull () {
  sfdx force:source:pull -u $1
}

data_import () {
  echo "*** Creating data from $2 to $1"
  sfdx force:data:tree:import -u $1 -p $2
}

assign_permset () {
  echo "*** Assigning $2 Permission Set in $1"
  sfdx force:user:permset:assign -u $1 -n $2
}

convert_mdtapi () {
  srcRoot=force-app/${1:-main}
  outputRoot=${2:-mdtapi}
  pkgName=${3:-unpackaged}

  echo "Converting $srcRoot to metadata in $outputRoot/$pkgName"
  sfdx force:source:convert -r $srcRoot -d $outputRoot/$pkgName
}

deploy_mdtapi () {
  outputRoot=${2:-mdtapi}
  pkgName=${3:-unpackaged}

  sfdx force:mdapi:deploy -d $outputRoot/$pkgName -u $1 -w 5
}