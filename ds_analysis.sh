#!/bin/bash

module loadd legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/

${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/*_perind_numers.counts.gz ${outdir}/gastroc_male_cv().txt
# The () is meant to be filled with 0, half, 1, 4, 7, 24, 48.
