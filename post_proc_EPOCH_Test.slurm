#!/bin/sh
#SBATCH --ntasks=64
#SBATCH --mem=62500
#SBATCH --time=48:30:00
#SBATCH --job-name=Test_post_proc
#SBATCH --error=/work/fuchs/lsx249/EPOCH_two_color_44/postproc.job.%J.err
#SBATCH --output=/work/fuchs/lsx249/EPOCH_two_color_44/postproc.job.%J.out

module purge
module load anaconda
conda activate epochenvironment

#python /work/fuchs/lsx249/scripts/postproc_tools/ppt.py make_movie name=EPOCH_two_color_44/Test_Fields dir=/work/fuchs/lsx249/EPOCH_two_color_44 cutoff=0
#python /work/fuchs/lsx249/scripts/postproc_tools/ppt.py phase_space name=EPOCH_two_color_44/Test_phase_space dir=/work/fuchs/lsx249/EPOCH_two_color_44 filter_p=0 size=0.25
python /work/fuchs/lsx249/scripts/postproc_tools/ppt.py 2d_phase_space data='N' name=EPOCH_two_color_44/Test_2d_phase_space dir=/work/fuchs/lsx249/EPOCH_two_color_44 t_cut=None filter_p=10 size=0.2 alpha=1 balpha=1 skip=4


mail -s "Postproc EPOCH_two_color_44 Finished" slee83@huskers.unl.edu
cgget -g memory /slurm/uid_${UID}/job_${SLURM_JOB_ID}
