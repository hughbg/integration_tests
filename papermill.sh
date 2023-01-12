#!/bin/sh
#SBATCH --job-name='paper_run'
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=128GB
#SBATCH --output=paper_run_%j.log
#SBATCH --time=24:00:00
#SBATCH -p hera


if [ -z $1 ]
then
  echo No input args
  exit
fi

if [ -z $2 ]
then  
  output=`echo $1 | sed s/\.ipynb/_out\.ipynb/`
else
  output=$2
fi

source  ~/miniconda3/etc/profile.d/conda.sh; conda activate frf_paper

date

papermill $1 $output


date

