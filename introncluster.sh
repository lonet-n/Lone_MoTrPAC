#!/bin/bash

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter

for sample in 90001015505 90015015505 90033015505 90037015505 90109015505 90123015505 90127015505 90141015505\
    90145015505 90159015505 90011015505 90029015505 90047015505 90119015505 90155015505 90013015505 90031015505\
    90121015505 90139015505 90157015505; do

    outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

    python /${leafcutter}/clustering/leafcutter_cluster.py -j ${outdir}/${sample}.txt -r ${outdir} -m 50 -o ${sample} -l 500000

done

