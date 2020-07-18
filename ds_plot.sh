#!/bin/bash

module loadd legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/

${leafcutter}/scripts/ds_plots.R -e ${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz \
${outdir}/gastroc_male_ds_analysis/.txt ${outdir}/gastroc_male_ds_analysis/leafcutter_ds_cluster_significance.txt -f 0.05
