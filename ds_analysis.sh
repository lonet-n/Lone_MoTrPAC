#!/bin/bash

module loadd legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter
outdir=/oak/stanford/groups/smontgom/lonet/motrpac

mkdir -p ${outdir}/gastroc_male_ds_analysis/cv0
mkdir -p ${outdir}/gastroc_male_ds_analysis/cvhalf
mkdir -p ${outdir}/gastroc_male_ds_analysis/cv1
mkdir -p ${outdir}/gastroc_male_ds_analysis/cv4
# mkdir -p ${outdir}/gastroc_male_ds_analysis/cv7
# mkdir -p ${outdir}/gastroc_male_ds_analysis/cv24
# mkdir -p ${outdir}/gastroc_male_ds_analysis/cv48

${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz ${outdir}/gastroc_male_groups/cv0.txt
mv leafcutter_ds_cluster_significance.txt ${outdir}/gastroc_male_ds_analysis/cv0
mv leafcutter_ds_effect_sizes.txt ${outdir}/gastroc_male_ds_analysis/cv0

${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz ${outdir}/gastroc_male_groups/cvhalf.txt
mv leafcutter_ds_cluster_significance.txt ${outdir}/gastroc_male_ds_analysis/cvhalf
mv leafcutter_ds_effect_sizes.txt ${outdir}/gastroc_male_ds_analysis/cvhalf

${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz ${outdir}/gastroc_male_groups/cv1.txt
mv leafcutter_ds_cluster_significance.txt ${outdir}/gastroc_male_ds_analysis/cv1
mv leafcutter_ds_effect_sizes.txt ${outdir}/gastroc_male_ds_analysis/cv1

${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz ${outdir}/gastroc_male_groups/cv4.txt
mv leafcutter_ds_cluster_significance.txt ${outdir}/gastroc_male_ds_analysis/cv4
mv leafcutter_ds_effect_sizes.txt ${outdir}/gastroc_male_ds_analysis/cv4



# The following have been commented out because LeafCutter is unable to perform the differential intron excision analysis on them.
# Leafcutter requires n≥4 samples, however these trials only have 3 samples. 

# ${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz ${outdir}/gastroc_male_groups/cv7.txt
# mv leafcutter_ds_cluster_significance.txt ${outdir}/gastroc_male_ds_analysis/cv7
# mv leafcutter_ds_effect_sizes.txt ${outdir}/gastroc_male_ds_analysis/cv7

# ${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz ${outdir}/gastroc_male_groups/cv24.txt
# mv leafcutter_ds_cluster_significance.txt ${outdir}/gastroc_male_ds_analysis/cv24
# mv leafcutter_ds_effect_sizes.txt ${outdir}/gastroc_male_ds_analysis/cv24

# ${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${outdir}/rn6_exons.txt.gz ${outdir}/gastroc_male_intron_cluster/*_perind_numers.counts.gz ${outdir}/gastroc_male_groups/cv48.txt
# mv leafcutter_ds_cluster_significance.txt ${outdir}/gastroc_male_ds_analysis/cv48
# mv leafcutter_ds_effect_sizes.txt ${outdir}/gastroc_male_ds_analysis/cv48
