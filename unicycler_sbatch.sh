#!/bin/bash
#SBATCH --ntasks=12              # 1 core(CPU)
#SBATCH --nodes=1                # Use 1 node
#SBATCH --job-name=unicycler # tensible name for the job
#SBATCH --mem=8G                 # Default memory per CPU is 3GB.
#SBATCH --partition=smallmem # Use the verysmallmem-partition for jobs requiring < 10 GB RAM.
#SBATCH --mail-user=stia@nmbu.no # Email me when job is done.
#SBATCH --mail-type=ALL

# If you would like to use more please adjust this.

# If you want to load module
module purge
module add unicycler

cd $TMPDIR
scp /mnt/users/stia/minion/nan9/nan9.fastq $TMPDIR
cd $TMPDIR

## Below you can put your scripts
unicycler -l nan9.fastq -o /mnt/users/stia/minion/nan9/assembly-unicycler

echo "End of program at `date`"

