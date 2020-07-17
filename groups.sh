for sample in 90001015505 90015015505 90033015505 90037015505 90109015505 90123015505 90127015505 90141015505 90145015505 90159015505 90011015505 90029015505 90047015505 90119015505 90155015505 90013015505 90031015505 90121015505 90139015505 90157015505; do

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

echo ${outdir}/${sample}Aligned.out.bam.junc >> ${outdir}/../junc_paths.txt

done


for sample in 90001015505 90015015505 90033015505 90037015505 90109015505 90123015505 90127015505 90141015505\
    90145015505 90159015505; do

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

echo ${sample}Aligned.out.bam control >> ${outdir}/../gastrocnemiusc1.txt

done


for sample in  90011015505 90029015505 90047015505 90119015505 90155015505; do

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

echo ${sample}Aligned.out.bam one_hour >> ${outdir}/../gastrocnemiusc1.txt

done


for sample in 90001015505 90015015505 90033015505 90037015505 90109015505 90123015505 90127015505 90141015505\
    90145015505 90159015505; do

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

echo ${sample}Aligned.out.bam control >> ${outdir}/../gastrocnemiusc4.txt

done


for sample in  90013015505 90031015505 90121015505 90139015505 90157015505; do 

outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/${sample}

echo ${sample}Aligned.out.bam four_hour >> ${outdir}/../gastrocnemiusc4.txt

done
