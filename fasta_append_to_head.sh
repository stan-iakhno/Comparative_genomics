#!/bin/sh
module load bbmap

for f in *fasta; do rename.sh in=$f out=${f/.fasta/mod.fasta} prefix=$f addprefix=t; done

