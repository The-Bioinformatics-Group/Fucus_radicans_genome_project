#!/bin/bash

#$ -cwd
#$ -q high_mem
#$ -S /bin/bash

FILE1=../best_practice_qc/P1980_101/fastq_trimmed/7_150716_AC6T07ANXX_P1980_101_1.fastq
FILE2=../best_practice_qc/P1980_101/fastq_trimmed/7_150716_AC6T07ANXX_P1980_101_2.fastq
PREPROCESSED=Fucus_radicans.preprocessed.fastq
GENOME=Fucus_radicans.preprocessed.preqc

sga preprocess --pe-mode 1 $FILE1 $FILE2 > $PREPROCESSED
sga index -a ropebwt --no-reverse -t 8 $PREPROCESSED
sga preqc -t 8 $PREPROCESSED > $GENOME
sga-preqc-report.py $GENOME /usr/local/bin/SGA-0.10.13/src/examples/preqc/*.preqc
