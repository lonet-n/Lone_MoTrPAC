sample = 80000885526

gindex = oak/stanford/groups/smontgom/nicolerg/MOTRPAC/RNA/REFERENCES/rn6_ensembl_r95/star_index
# This is the path to the STAR index.
base = projects/motrpac/PASS1A/RNA/NOVASEQ_BATCH1/from_bic
# This is the path to the directory with the STAR Align and FastQ files.
outdir = oak/stanford/groups/smontgom/lonet/motrpac/star_secondpass/{sample}
# This is the directory where all the files will output.
leafcutter = scg/apps/legacy/software/leafcutter/0.2.7/leafcutter

python /{leafcutter}/clustering/leafcutter_cluster.py -j {outdir}/{sample}.txt -m 50 -o {sample} -l 500000
