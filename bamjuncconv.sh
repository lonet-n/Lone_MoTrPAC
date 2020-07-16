#!/bin/bash

#SBATCH -A default
#SBATCH -p interactive
#SBATCH -c 4
#SBATCH --mem=40G
#SBATCH -t 1-00:00:00
set -e

module load STAR/2.7.0d
module load legacy
module load leafcutter

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

for bamfile in `ls ${outdir}/${sample}*.bam`
do
    echo Converting $bamfile to $bamfile.junc
    sh bam2junc.sh $bamfile $bamfile.junc
    echo $bamfile.junc >> ${outdir}/${sample}.txt
done
