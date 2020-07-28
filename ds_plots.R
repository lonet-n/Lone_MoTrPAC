#!/usr/bin/env Rscript

for (file in list.files('/scg/apps/legacy/software/leafcutter/0.2.7/leafcutter/leafcutter/R', full.names = TRUE)){
  source(file)
}

library(optparse)
library(graphics)
library(intervals)
library(ggplot2)
library(dplyr)
library(foreach)
library(rstan)
library(gridExtra)
library(reshape2)
library(Hmisc)
# library(leafcutter)

groups <- c('cv0','cvhalf','cv1','cv4','cv7','cv24','cv48')
groups <- unlist(strsplit(groups, " "))
desired_length <- 7 # or whatever length you want
list_sig <- rep(NA, desired_length)
k=1

for (i in groups[1:7]) {
	if (i == "cv0") {
		groups_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_groups/cv0.txt" 
	} else if (i == "cvhalf") {
		groups_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_groups/cvhalf.txt"
	} else if (i == "cv1") {
		groups_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_groups/cv1.txt"
	} else if (i == "cv4") {
		groups_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_groups/cv4.txt"
	} else if (i == "cv7") {
		groups_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_groups/cv7.txt"
	} else if (i == "cv24") {
		groups_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_groups/cv24.txt"
	} else if (i == "cv48") {
		groups_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_groups/cv48.txt"
	}

  cluster_significance_file <- file.path("/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_ds_analysis",i,"leafcutter_ds_cluster_significance.txt")
  exon_file <- "/oak/stanford/groups/smontgom/lonet/motrpac/rn6_exons.txt.gz"
  output <- file.path("/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_ds_analysis",i,"sashimi.pdf")
  counts_file="/oak/stanford/groups/smontgom/lonet/motrpac/gastroc_male_intron_cluster/gastroc_male_perind_numers.counts.gz"
  
  cat("Loading counts from",counts_file,"\n")
  if (!file.exists(counts_file)) stop("File ",counts_file," does not exist")
  counts=read.table(counts_file, header=T, check.names=F, stringsAsFactors = F)
  
  cat("Loading metadata from",groups_file,"\n")
  if (!file.exists(groups_file)) stop("File ",groups_file," does not exist")
  meta=read.table(groups_file, header=F, stringsAsFactors = F)
  colnames(meta)=c("sample","group")
  
  exon_table=if (!is.null(exon_file)) {
    cat("Loading exons from",exon_file,"\n")
    if (!file.exists(exon_file)) stop("File ",exon_file," does not exist")
    read.table(exon_file, header=T, stringsAsFactors = F)
  } else {
    cat("No exon_file provided.\n")
    NULL
  }
  
  counts=counts[,meta$sample]
  
  meta$group=as.factor(meta$group)
  group_names=levels(meta$group)
  
  stopifnot(length(group_names)==2)
  
  if (!file.exists(cluster_significance_file)) stop("File ",cluster_significance_file," does not exist")
  cluster_table=read.table(cluster_significance_file, header=T, sep="\t", stringsAsFactors = F)
  
  qvalues=p.adjust(cluster_table$p, method='BH') # leafcutter:::bh(cluster_table$p)
  top_clus=cluster_table$cluster[ which(qvalues < 0.05) ]
  
  
  list_sig[k]=length(top_clus)
  k=k+1
  
  df = data.frame(group = groups, 
                  significant = list_sig)
  write.table(df, file = '/oak/stanford/groups/smontgom/lonet/motrpac/topclus.txt', sep = "\t", row.names = FALSE)
  
  if (length(top_clus) > 30)
    top_clus=cluster_table$cluster[ order(qvalues)[seq_len(30)] ]
  
  cat("Saving",length(top_clus),"plots to",output,"\n")
  introns=get_intron_meta(rownames(counts))
  cluster_ids=paste( add_chr(introns$chr),introns$clu,sep = ":")
  
  pdf(output, width=8, height=8)
  for (clu in top_clus) {
    print(clu)
    y=t(counts[ cluster_ids==clu, ])
    make_differential_splicing_plot(y, meta$group, exons_table=exon_table)
  }
  
  dev.off()
  
  cat("All done, exiting\n")
}
