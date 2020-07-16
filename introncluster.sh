#!/bin/bash

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/

python /${leafcutter}/clustering/leafcutter_cluster.py -j ${outdir}/junc_path.txt -r ${outdir} -m 50 -o gastrocnemius -l 50000
