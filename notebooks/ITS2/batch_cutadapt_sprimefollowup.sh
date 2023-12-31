#!/bin/bash

############### user inputs

# specify paths of input and output folders
dir='/project/mmicrobe/MLSH/ITS2/raw/Plate1-2/lane1'

filtdir='cutadapt'
filtdir="$dir/$filtdir"

outdir='cutadapt2'
outdir="$dir/$outdir"

unTdir="untrimmed"
dir3="$dir/$unTdir"

# Specify primer sequences

FWD="TCTTTCCCTACACGACGCTCTTCCGATCT"
REV="GTGACTGGAGTTCAGACGTGTGCTCTTCCGATCT"
FWDrc="AGATCGGAAGAGCGTCGTGTAGGGAAAGA"
REVrc="AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC"

##################

module load cutadapt

# Check for output directory and if not present, make directory

if [ ! -d $outdir ]; then
  mkdir -p $outdir;
fi

if [ ! -d $dir3 ]; then
  mkdir -p $dir3;
fi


# for loop to find all files with R1 in name, change their name to R2 and write out new filename to a new file in a new directory

for r1 in $filtdir/*_R1_*; do

r2=${r1/_R1_/_R2_}

baseR1=${r1##*/}
baseR2=${r2##*/}


fnFsCut="$outdir/$baseR1"
fnRsCut="$outdir/$baseR2"
untrimmedF="$dir3/untrimmed.$baseR1"
untrimmedR="$dir3/untrimmed.$baseR2"


#echo $baseR2
#echo $dir3
#echo  $untrimmedR

cutadapt -g $FWD \
	-a $REVrc \
	-G $REV \
	-A $FWDrc \
	-n 2 \
	-m 50 \
	-o $fnFsCut \
	-p $fnRsCut \
	$r1 \
	$r2
done
