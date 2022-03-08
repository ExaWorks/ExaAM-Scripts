#!/bin/bash
set -eu

if (( ${#} != 1 ))
then
  echo "run-swift.sh: Provide a workflow!"
  exit 1
fi

WORKFLOW=$1

MED106=/gpfs/alpine/world-shared/med106
ROOT=$MED106/sw/gcc-8.3.1
SWIFT=$ROOT/swift-t/2021-10-06

PATH=$SWIFT/stc/bin:$PATH

export PROJECT=MED106

swift-t -m lsf $WORKFLOW
