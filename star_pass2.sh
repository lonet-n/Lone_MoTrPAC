#!/bin/bash

#SBATCH -A smontgom
#SBATCH -c 4
#SBATCH --mem=50G
#SBATCH -t 8:00:00
set -e 


# for sample in 90001015505 90015015505 90033015505 90037015505 90109015505 90123015505 90127015505 90141015505\
#	90145015505 90159015505 90011015505 90029015505 90047015505 90119015505 90155015505 90013015505 90031015505\
#	90121015505 90139015505 90157015505; do 
#	sbatch --export=sample=${sample} star_pass2.sh
# done
# This is the code for gene alignment of control 0h, control 7h, exercise 1h, and exercise 4h data from the gastrocnemius male rats.

# for sample in 90009015505 90028015505 90046015505 90118015505 90136015505 \
#	90007015505 90025015505 90043015505 90115015505 90133015505 \
#	90017015505 90053015505 90143015505 \
#	90039015505 90129015505 90147015505 \
#	90005015505 90023015505 90041015505; do
#	sbatch --export=sample=${sample} star_pass2.sh
# done
# This is the code for gene alignment of exercise 0h, exercise 0.5h, exercise 7h, exercise 24h, and exercise 48h data from the gastrocnemius male rats.

module load STAR/2.7.0d
module load legacy
module load leafcutter

mkdir -p /oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

gindex=/projects/motrpac/PIPELINES/REFERENCES/rn6_ensembl_r96/star_index
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
     --limitSjdbInsertNsj 2000000 \
     --runThreadN 4
