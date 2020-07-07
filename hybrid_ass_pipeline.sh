# remove adapters

for f1 in *.fastq; do f2=${f1%%R1_001.fastq}"R2_001.fastq"; ./fastp -i $f1 -I $f2 -o ${f1/R1_001.fastq/R1_noadapt_001.fastq} -O ${f2/R2_001.fastq/R2_noadapt_001.fastq} --detect_adapter_for_pe; done

# trim

for f1 in *.fastq
do
    bbduk.sh  in1=$f1 out1=$WORK_DIR/bbduk_filt/${f1/.fastq/.bbfilt.fastq} qtrim=lr trimq=30 minlen=150 maq=20 ftl=10
done

# remove orphan reads

python fastqCombinePairedEnd.py fq1 fq2

# assembly

unicycler -1 short_R1.fastq -2 short_R2.fastq -l long.fastq.gz -o $WORK_DIR/output_dir
