#!/bin/bash

module load legacy
module load leafcutter

leafcutter=/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter
gindex=/projects/motrpac/PIPELINES/REFERENCES/rn6_ensembl_r96

${leafcutter}/scripts/gtf_to_exons.R ${gindex}/genome.gtf.gz rn6_exons.txt.gz
# This uses the gtf file for the rat genome to make an exon file.

mv rn6_exons.txt.gz ../motrpac
#This moves the exon file to the motrpac directory.
