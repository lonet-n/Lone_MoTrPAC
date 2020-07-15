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

mkdir -p /oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

gindex=/projects/motrpac/PIPELINES/REFERENCES/rn6_ensembl_r96
# This is the path to the STAR index.
base=/projects/motrpac/PASS1A/RNA/NOVASEQ_BATCH1/from_bic
# This is the path to the directory with the STAR Align and FastQ files.
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}
# This is the directory where all the files will output.

STAR --genomeDir ${gindex} \
     --outSAMstrandField intronMotif \
     --readFilesCommand zcat \
     --outSAMtype BAM Unsorted \
     --sjdbFileChrStartEnd ${base}/star_align/gastrocnemius/*.SJ.out.tab \
     --readFilesIn ${base}/fastq_trim/gastrocnemius/${sample}_R1.fastq.gz ${base}/fastq_trim/gastrocnemius/${sample}_R2.fastq.gz \
     --outFileNamePrefix ${outdir}/${sample} \
     --limitSjdbInsertNsj 1700000 \
     --runThreadN 4
