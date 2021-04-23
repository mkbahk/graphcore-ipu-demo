#!/bin/bash
#
#SBATCH --job-name=sleep-test
#SBATCH --output=sleep-result.txt
#SBATCH --ntasks=50
#SBATCH --time=00:01
srun echo "=========START==========="
srun sleep 10
srun hostname
srun ifconfig
srun ping 8.8.8.8 -c 10
srun echo "=========END==========="
