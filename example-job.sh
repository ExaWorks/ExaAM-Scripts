### LSF syntax
#BSUB -nnodes 8                   #number of nodes
#BSUB -W 75                       #walltime in minutes
#BSUB -P MAT190                   #account
#BSUB -e gpu_exa_error.txt        #stderr
#BSUB -o gpu_exa_out.txt          #stdout
#BSUB -J ExaConstit               #name of job
#BSUB -alloc_flags smt1

# Author: carson16
# Copied from OLCF: /gpfs/alpine/world-shared/mat190/exaconstit/example-job.sh

date
module load gcc/7.5.0 cuda/11.4.2 adios2/2.7.1 zlib/1.2.11
jsrun -n48 -r6 -c1 -g 1 ./exaconstit-mechanics -opt options.toml
