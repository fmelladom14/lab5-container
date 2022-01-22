#!/bin/bash
#
#SBATCH -p hpc-bio-pacioli
#SBATCH --chdir=/home/alumno14/lab5-container/singularity
#SBATCH -J FcoMellado.Lab5
#SBATCH --cpus-per-task=1
#SBATCH --output=output_manejando_container.sh
#SBATCH --mail-type=END #END/START/NONE
#SBATCH --mail-user=francisco.mellado@um.es

# Affinity
#export KMP_AFFINITY=granularity=fine,compact

# Number of threads
#export OMP_NUM_THREADS=32
#16,32

#Cargamos el modulo de singularity

module load singularity/3.8.0

# a) La versión del sistema operativo en la imagen

singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif cat /etc/os-release

# b) El contenido del directorio que estamos viendos
 
singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif  ls -l

# c) El path del directorio que estamos viendo

singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif pwd

# d) La versión de python

singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif python --version

# e)  La versión del compilador de c++

singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif g++ --version

# f) Ejecuta el k-mers de longitud 13 compilado de C++ y mide su tiempo de ejecución (¡ojo!, nolo hagas con los programas escritos en python pues son mucho más lentos y nos colapsaránel nodo de entrada al clúster).

time singularity exec /nas/hdd-0/singularity_images/python_3-9-1.sif ../data/k-mer13


#Descargamos el modulo de singularity 

module unload singularity/3.8.0
