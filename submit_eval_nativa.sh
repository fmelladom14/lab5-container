#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab5-container/data
#SBATCH -J FcoMellado.Lab5
#SBATCH --cpus-per-task=16
#SBATCH --mail-type=END	#END/START/NONE
#SBATCH --mail-user=francisco.mellado@um.es

# Affinity
#export KMP_AFFINITY=granularity=fine,compact

# Number of threads
#export OMP_NUM_THREADS=32
#16,32

# Tiempo de ejecución para python
echo "Ejecucion de los programas de Python"
echo "                                    "
echo "Programa k-mers13"
time python k-mer13.py
echo "                                    "
echo "Programa k-mers14"
time python k-mer14.py

# Tiempo de ejecución  C++

echo "Ejecucion de los programas de C++"
echo "                                    "
echo "Programa k-mers13"
time ./k-mer13

echo "                                    "
echo "Programa k-mers14"
time ./k-mer14
