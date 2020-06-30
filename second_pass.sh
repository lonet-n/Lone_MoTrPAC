# SID is the viallabel (file name prefix)
# code used to do first pass alignment:

# STAR  --genomeDir $gdir/star_index\
#       --sjdbOverhang  100\
#       --readFilesIn "$@"\
#       --outFileNamePrefix star_align/${SID}/\
#       --readFilesCommand zcat \
#       --outSAMattributes NH HI AS NM MD nM\
#       --runThreadN $threads\
#       --outSAMtype BAM SortedByCoordinate\
#       --outFilterType BySJout\
#       --quantMode TranscriptomeSAM\

# screen -S star_secondpass
# sdev -c 4 -m 20G -t 48:00:00 

module load STAR/2.7.0d

gindex=/oak/stanford/groups/smontgom/nicolerg/MOTRPAC/RNA/REFERENCES/rn6_ensembl_r95/star_index
# This is the path to the STAR index.
base=/projects/motrpac/PASS1A/RNA/NOVASEQ_BATCH1/from_bic
# This is the path to the directory with the STAR Align and FastQ files.
outdir=/oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass
# This is the directory where all the files will output.
sample=80000885526
# This is the first sample we will be testing– the code will eventually be parallelized so each sample is not completed individually.

STAR --genomeDir ${gindex} \
	 --outSAMstrandField intronMotif \
	 --readFilesCommand zcat \
	 --outSAMtype BAM Unsorted \
	 --sjdbFileChrStartEnd ${base}/star_align/*.SJ.out.tab \
	 --readFilesIn ${base}/fastq_trim/${sample}_R1.fastq.gz ${base}/fastq_trim/${sample}_R2.fastq.gz \
	 --outFileNamePrefix ${outdir}/${sample} \
	 --runThreadN 4

