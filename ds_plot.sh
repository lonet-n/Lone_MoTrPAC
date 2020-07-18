#!/bin/bash

module loadd legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/

${leafcutter}/scripts/ds_plots.R -e ${outdir}/rn6_exons.txt.gz ${outdir}/*_perind_numers.counts.gz ${outdir}/gastroc_male_cv().txt leafcutter_ds_cluster_significance.txt -f 0.05
# The () is meant to be filled with 0, half, 1, 4, 7, 24, 48.
