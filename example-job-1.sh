#!/bin/bash -l
set -eu
# Run as login shell for modules

### LSF syntax
#BSUB -nnodes 1                   #number of nodes
#BSUB -W  5                       #walltime in minutes
#BSUB -P MED106                   #account
#BSUB -e gpu_exa_error.txt        #stderr
#BSUB -o gpu_exa_out.txt          #stdout
#BSUB -J ExaConstit               #name of job
#BSUB -alloc_flags smt1

# Author: carson16
# Copied from OLCF: /gpfs/alpine/world-shared/mat190/exaconstit/example-job.sh

date
module load gcc/7.5.0 cuda/11.4.2 adios2/2.7.1 zlib/1.2.11

PATH=/gpfs/alpine/world-shared/mat190/exaconstit:$PATH

jsrun -n6 -r6 -c1 -g 1 exaconstit-mechanics -opt options.toml
