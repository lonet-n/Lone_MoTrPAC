#!/bin/bash

module loadd legacy
module load leafcutter

for sample in 90001015505 90015015505 90033015505 90037015505 90109015505 90123015505 90127015505 90141015505 90145015505 90159015505 90011015505 90029015505 90047015505 90119015505 90155015505 90013015505 90031015505 90121015505 90139015505 90157015505; do

    leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter

    outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

    ${leafcutter}/scripts/leafcutter_ds.R --num_threads 4 --exon_file=${leafcutter}/leafcutter/data/gencode19_exons.txt.gz ${outdir}/*_perind_numers.counts.gz ${outdir}/../gastrocnemius2.txt

done
