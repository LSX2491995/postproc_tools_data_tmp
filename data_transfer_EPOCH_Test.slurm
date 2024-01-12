#!/bin/sh
#SBATCH --ntasks=1
#SBATCH --mem=32000
#SBATCH --time=48:00:00
#SBATCH --job-name=Test_data_xfer
#SBATCH --error=/work/fuchs/lsx249/EPOCH_two_color_44/datatransfer.job.%J.err
#SBATCH --output=/work/fuchs/lsx249/EPOCH_two_color_44/datatransfer.job.%J.out

module load anaconda
conda activate epochenvironment


bash $scripts/box.sh -d EPOCH/EPOCH_Test -l /work/fuchs/lsx249/ EPOCH_Test

mail -s "Data Transfer EPOCH_two_color_44 Finished" slee83@huskers.unl.edu
cgget -g memory /slurm/uid_${UID}/job_${SLURM_JOB_ID}
