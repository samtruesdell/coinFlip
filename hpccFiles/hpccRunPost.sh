#!/bin/bash

#BSUB -W 00:15                    # How much time does your job need (HH:MM)
#BSUB -q short                    # Which queue
#BSUB -J "hpccRunPost"            # Job Name
#BSUB -R rusage[mem=1000]         # Memory requirements (in MB)
#BSUB -n 1                        # Number of nodes to use
#BSUB -o "./%J.o"                 # Specifies name of the output file
#BSUB -e "./%J.e"                 # Specifies name of the error file
#BSUB -w 'done(runSim[1-10])'     # wait to submit until down with runSim job

module load R/3.4.0               # load R module
cd coinFlip/                       # change directories to groundfish-MSE
Rscript ./runPost.R --vanilla      # Run the runPost.R code

echo "runPost complete"           # Print statement indicating job is done