#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab5-container/singularity
#SBATCH -J FcoMellado.Lab5
#SBATCH --cpus-per-task=1
#SBATCH --mail-type=END	#END/START/NONE
#SBATCH --mail-user=francisco.mellado@um.es

# Affinity
#export KMP_AFFINITY=granularity=fine,compact

# Number of threads
#export OMP_NUM_THREADS=32


# Tiempo de ejecución para python
echo "Ejecucion de los programas de Python"

#Tiempo de ejecuión para python 
module load singularity/3.8.0 

time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ../data/k-mer13.py 
time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ../data/k-mer14.py

echo "Ejecución de los programas de C++"

#Tiempo de ejecucion c++
time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ../data/k-mer13 
time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ../data/k-mer14

#Descargamos el modulo  
module unload singularity/3.8.0


