#!/bin/bash

module loadd legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/

${leafcutter}/scripts/ds_plots.R -e ${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/gastroc_male_perind_numers.counts.gz \
${outdir}/gastroc_male_groups/gastroc_male_cv0.txt ${outdir}/gastroc_male_ds_analysis/cv0/leafcutter_ds_cluster_significance.txt -f 0.05

${leafcutter}/scripts/ds_plots.R -e ${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/gastroc_male_perind_numers.counts.gz \
${outdir}/gastroc_male_groups/gastroc_male_cvhalf.txt ${outdir}/gastroc_male_ds_analysis/cvhalf/leafcutter_ds_cluster_significance.txt -f 0.05

${leafcutter}/scripts/ds_plots.R -e ${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/gastroc_male_perind_numers.counts.gz \
${outdir}/gastroc_male_groups/gastroc_male_cv1.txt ${outdir}/gastroc_male_ds_analysis/cv1/leafcutter_ds_cluster_significance.txt -f 0.05

${leafcutter}/scripts/ds_plots.R -e ${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/gastroc_male_perind_numers.counts.gz \
${outdir}/gastroc_male_groups/gastroc_male_cv4.txt ${outdir}/gastroc_male_ds_analysis/cv4/leafcutter_ds_cluster_significance.txt -f 0.05
