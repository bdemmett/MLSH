# MLSH
Code for Multilocation Soil Health Project sequence analysis. 16S and ITS2 amplicon sequences from the MLSH project are processed in Qiime2 and DADA2 respectively.  

# ITS2

ITS2 amplicon libraries processed in R using DADA2. 


1-DADA2-MLSH_ITSPlate2-4.Rmd
1-DADA2-MLSH_ITSPlate1-2.Rmd
- Filtering, denoising and chimera checking of each sequencing run
- Trimming done in separate script using batch_cutadapt.sh and batch_cutadapt_sprimefollowup.sh to remove sequencing primers and amplicon primers from both ends of the reads.

2-MergeRuns_AssignTax_Handoff.Rmd
- Sequence tables from processed runs are merged, mismatches collapsed and taxonomy assigned using the UNITE database
- Metadata joined using the combined primer map and the mlsh_full table.  This section is a bit messy and could be cleaned up.
- Extra libraries (Kelley trial runs) removed
- Phyloseq objects for controls, field and combined samples saved for downstream analysis

