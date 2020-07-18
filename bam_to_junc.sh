#!/bin/bash

#SBATCH -A default
#SBATCH -p interactive
#SBATCH -c 4
#SBATCH --mem=40G
#SBATCH -t 1-00:00:00
set -e

#################

# for sample in 90001015505 90015015505 90033015505 90037015505 90109015505 90123015505 90127015505 90141015505\
#	90145015505 90159015505 90011015505 90029015505 90047015505 90119015505 90155015505 90013015505 90031015505\
#	90121015505 90139015505 90157015505; do 
#	sbatch --export=sample=${sample} bam_to_junc.sh
# done
# This takes bam files as inputs and outputs junc files for the male gastrocnemius control 0h, control 7h, exercise 1h, and exercise 4h samples.  

#################

# for sample in 90009015505 90028015505 90046015505 90118015505 90136015505 \
#	90007015505 90025015505 90043015505 90115015505 90133015505 \
#	90017015505 90053015505 90143015505 \
#	90039015505 90129015505 90147015505 \
#	90005015505 90023015505 90041015505; do
#	sbatch --export=sample=${sample} bam_to_junc.sh
# done
# This takes bam files as inputs and outputs junc files for the male gastrocnemius exercise 0h, exercise 0.5h, exercise 7h, exercise 24h, and exercise 48h samples.

#################

module load STAR/2.7.0d
module load legacy
module load leafcutter

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

for bamfile in `ls ${outdir}/${sample}*.bam` # This finds and lists the bam files for the sample viallable.
do
    echo Converting $bamfile to $bamfile.junc 
    sh bam2junc.sh $bamfile $bamfile.junc # This converts the bam file to a junc file.
    echo $bamfile.junc >> ${outdir}/${sample}.txt # This writes the new junc path into a text file.
done
