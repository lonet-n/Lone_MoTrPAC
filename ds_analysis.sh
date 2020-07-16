#!/bin/bash

module loadd legacy
module load leafcutter

    leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter

    outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/

    ${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${leafcutter}/leafcutter/data/gencode19_exons.txt.gz ${outdir}/*_perind_numers.counts.gz ${outdir}/gastrocnemius.txt

done
