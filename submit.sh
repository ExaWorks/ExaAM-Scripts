#!/bin/bash
set -eu

if (( ${#} != 1 ))
then
  echo "submit.sh: Provide a job!"
  exit 1
fi

JOB=$1

shopt -s nullglob
for f in *.log
do
  mv -v --backup=numbered --no-target-directory $f $f.bak~
done

bsub $JOB
