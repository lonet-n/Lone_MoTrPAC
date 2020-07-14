#!/bin/bash

module load STAR/2.7.0d
module load legacy
module load leafcutter

sample=80000885526

gindex=/oak/stanford/groups/smontgom/nicolerg/MOTRPAC/RNA/REFERENCES/rn6_ensembl_r95/star_index
# This is the path to the STAR index.
base=/projects/motrpac/PASS1A/RNA/NOVASEQ_BATCH1/from_bic
# This is the path to the directory with the STAR Align and FastQ files.
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}
# This is the directory where all the files will output.
leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter

${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${leafcutter}/leafcutter/data/gencode19_exons.txt.gz ${outdir}/${sample}_intron/*_perind_numers.counts.gz ${outdir}/../groups_file.txt

