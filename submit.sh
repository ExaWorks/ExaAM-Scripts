#!/bin/bash
set -eu

if (( ${#} != 1 ))
then
  echo "submit.sh: Provide a job!"
  exit 1
fi

JOB=$1

for f in *.txt
do
  mv -v --backup=numbered $f $f.bak~
done

bsub $JOB
