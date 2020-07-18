#!/bin/bash

module load legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter # This is a path to the Leafcutter folder.
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass
intron_prefix=gastroc_male

mkdir -p ${outdir}/${intron_prefix}_intron_cluster # This will make a directory that will house all of the files produced.

python ${leafcutter}/clustering/leafcutter_cluster.py -j ${outdir}/junc_paths.txt -r ${outdir}/${intron_prefix}_intron_cluster -m 50 -o ${intron_prefix} -l 50000
# This clusters the introns in the junc files listed in junc_path.txt together.
# This requires a 50 split read supporting each cluster.
# This allows introns of up to 500kb.
# -o {intron_prefix}  means that the output of the intron clustering will be given that prefix: gastroc_male_perind_numers.counts.gz
# -r ${outdir}/${intron_prefix}_intron_cluster is the location where all of the files will output.
