#!/bin/bash

#BSUB -W 00:59                # How much time does your job need (HH:MM)
#BSUB -q short                # Which queue
#BSUB -J "hpccRunPre"         # Job Name
#BSUB -R rusage[mem=1000]     # Memory requirements (in MB)
#BSUB -n 1                    # Number of nodes to use
#BSUB -o "./%J.o"             # Specifies name of the output file
#BSUB -e "./%J.e"             # Specifies name of the error file


#rm -r -f coinFlip/            # remove old directory

#module load git/2.1.3         # load the git module

# clone the repository
#git clone https://github.com/samtruesdell/coinFlip

module load R/3.4.0          # load R module

#cd coinFlip/                 # change directories to coinFlip

Rscript ./runPre.R --vanilla    # Run the runPre.R code

echo "runPre complete"       # Print statement indicating job is done
