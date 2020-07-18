#!/bin/bash

module load legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter # This is a path to the Leafcutter folder.

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/

python ${leafcutter}/clustering/leafcutter_cluster.py -j ${outdir}/junc_path.txt -r ${outdir} -m 50 -o gastroc_male -l 50000
# This clusters the introns in the junc files listed in junc_path.txt together.
# This requires a 50 split read supporting each cluster.
# This allows introns of up to 500kb.
# -o gastroc_male means that the output of the intron clustering will be given that prefix: gastroc_male_perind_numers.counts.gz
