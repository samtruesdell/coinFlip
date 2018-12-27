#!/bin/bash

#BSUB -W 00:15                # How much time does your job need (HH:MM)
#BSUB -q short                # Which queue {short, long, parallel, GPU, interactive}
#BSUB -J "run"                # Job Name
#BSUB -R rusage[mem=1000]     # Memory requirements (in MB)
#BSUB -n 1                    # Number of nodes to use
#BSUB -o "./%J.o"             # Specifies name of the output file
#BSUB -e "./%J.e"             # Specifies name of the error file


bsub < hpccRunPre.sh          # Submit job runPre.sh
bsub < hppcRunFlip.sh         # Submit job runSim.sh
bsub < hppcRunPost.sh         # Submit job runPost.sh

echo "run complete"           # Print statement indicating job is done