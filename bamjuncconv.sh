#!/bin/bash

#SBATCH --job-name=bamjuncconv
#SBATCH --cpus-per-task=4
#SBATCH --partition=interactive
#SBATCH --account=default
#SBATCH --time=24:00:00
#SBATCH --mem-per-cpu=20G

module load STAR/2.7.0d
module load legacy
module load leafcutter

sample=80001995526
# This is the first sample we will be testing– the code will eventually be parallelized so each sample is not completed individually.
gindex=/oak/stanford/groups/smontgom/nicolerg/MOTRPAC/RNA/REFERENCES/rn6_ensembl_r95/star_index
# This is the path to the STAR index.
base=/projects/motrpac/PASS1A/RNA/NOVASEQ_BATCH1/from_bic
# This is the path to the directory with the STAR Align and FastQ files.
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}
# This is the directory where all the files will output.
leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter

for bamfile in `ls ${outdir}/${sample}*.bam`
do
    echo Converting $bamfile to $bamfile.junc
    sh bam2junc.sh $bamfile $bamfile.junc
    echo $bamfile.junc >> ${outdir}/${sample}.txt
done
