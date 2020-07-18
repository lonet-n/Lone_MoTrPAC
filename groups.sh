control_0h=( "90001015505" "90037015505" "90109015505" "90127015505" "90145015505" ) # 0h male gastroc control viallables
control_7h=( "90015015505" "90033015505" "90123015505" "90141015505" "90159015505" ) # 7h male gastroc control viallables
exercised_0h=( "90009015505" "90028015505" "90046015505" "90118015505" "90136015505" ) # 0h male gastroc exercised viallables
exercised_halfh=( "90007015505" "90025015505" "90043015505" "90115015505" "90133015505" ) # 0.5h male gastroc exercised viallables
exercised_1h=( "90011015505" "90029015505" "90047015505" "90119015505" "90155015505" ) # 1h male gastroc exercised viallables
exercised_4h=( "90013015505" "90031015505" "90121015505" "90139015505" "90157015505" ) # 4h male gastroc exercised viallables
exercised_7h=( "90017015505" "90053015505" "90143015505" ) # 7h male gastroc exercised viallables
exercised_24h=( "90039015505" "90129015505" "90147015505" ) # 24h male gastroc exercised viallables
exercised_48h=( "90005015505" "90023015505" "90041015505" ) # 48h male gastroc exercised viallables

outdir=/oak/stanford/groups/smontgom/lonet/motrpac # This will make a directory to group all of the gastroc. grouping files.

mkdir -p ${outdir}/gastroc_male_groups

##############

for sample in ${control_0h[*]} ${control_7h[*]} ${exercised_0h[*]} ${exercised_halfh[*]} \
${exercised_1h[*]} ${exercised_4h[*]} ${exercised_7h[*]} ${exercised_24h[*]} ${exercised_48h[*]}; do

echo ${outdir}/star_secondpass/${sample}/${sample}Aligned.out.bam.junc >> ${outdir}/star_secondpass/junc_paths.txt

done
# This makes a text file with the paths to all of the .junc files that will be used in the intron clustering step. 

##############

for sample in ${control_0h[*]} ${control_7h[*]}; do

echo ${sample}Aligned.out.bam control >> ${outdir}/gastroc_male_groups/gastroc_male_cv0.txt

done


for sample in ${exercised_0h[*]}; do # 0h male gastroc exercised

echo ${sample}Aligned.out.bam zero_hour >> ${outdir}/gastroc_male_groups/gastroc_male_cv0.txt

done
# This makes a text file with the bam file names for the control vs 0h exercise differential intron excision analysis.

##############

for sample in ${control_0h[*]} ${control_7h[*]}; do

echo ${sample}Aligned.out.bam control >> ${outdir}/gastroc_male_groups/gastroc_male_cvhalf.txt

done

for sample in ${exercised_halfh[*]}; do # 0.5h male gastroc exercised

echo ${sample}Aligned.out.bam half_hour >> ${outdir}/gastroc_male_groups/gastroc_male_cvhalf.txt

done
# This makes a text file with the bam file names for the control vs 0.5h exercise differential intron excision analysis.

##############

for sample in ${control_0h[*]} ${control_7h[*]}; do

echo ${sample}Aligned.out.bam control >> ${outdir}/gastroc_male_groups/gastroc_male_cv1.txt

done

for sample in ${exercised_1h[*]}; do # 1h male gastroc exercised

echo ${sample}Aligned.out.bam one_hour >> ${outdir}/gastroc_male_groups/gastroc_male_cv1.txt

done
# This makes a text file with the bam file names for the control vs 1h exercise differential intron excision analysis.

##############

for sample in ${control_0h[*]} ${control_7h[*]}; do

echo ${sample}Aligned.out.bam control >> ${outdir}/gastroc_male_groups/gastroc_male_cv4.txt

done

for sample in ${exercised_4h[*]}; do # 4h male gastroc exercised

echo ${sample}Aligned.out.bam four_hour >> ${outdir}/gastroc_male_groups/gastroc_male_cv4.txt

done
# This makes a text file with the bam file names for the control vs 4h exercise differential intron excision analysis.

##############

for sample in ${control_0h[*]} ${control_7h[*]}; do

echo ${sample}Aligned.out.bam control >> ${outdir}/gastroc_male_groups/gastroc_male_cv7.txt

done

for sample in ${exercised_7h[*]}; do # 7h male gastroc exercised

echo ${sample}Aligned.out.bam seven_hour >> ${outdir}/gastroc_male_groups/gastroc_male_cv7.txt

done
# This makes a text file with the bam file names for the control vs 7h exercise differential intron excision analysis.

##############

for sample in ${control_0h[*]} ${control_7h[*]}; do

echo ${sample}Aligned.out.bam control >> ${outdir}/gastroc_male_groups/gastroc_male_cv24.txt

done

for sample in ${exercised_24h[*]}; do # 24h male gastroc exercised

echo ${sample}Aligned.out.bam twentyfour_hour >> ${outdir}/gastroc_male_groups/gastroc_male_cv24.txt

done
# This makes a text file with the bam file names for the control vs 24h exercise differential intron excision analysis.

##############

for sample in ${control_0h[*]} ${control_7h[*]}; do

echo ${sample}Aligned.out.bam control >> ${outdir}/gastroc_male_groups/gastroc_male_cv48.txt

done

for sample in ${exercised_48h[*]}; do # 48h male gastroc exercised

echo ${sample}Aligned.out.bam fortyeight_hour >> ${outdir}/gastroc_male_groups/gastroc_male_cv48.txt

done
# This makes a text file with the bam file names for the control vs 48h exercise differential intron excision analysis.

