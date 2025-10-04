#!/bin/bash
#SBATCH -J nfcorernavar
#SBATCH -p workq
#SBATCH --mem=100G
#SBATCH --cpus-per-task=12


module purge
module load bioinfo/NextflowWorkflows/nfcore-Nextflow-v25.04.0
#module load  bioinfo/Nextflow/25.04.0
#module load  bioinfo/Nextflow/25.04.0
#Need Java 17.0.6
#module load devel/java/17.0.6

# Définir le chemin vers ton STAR local
export PATH=/work/user/fmt116/TP_nextflow/projet_nextflow/sra_tools/star_index/STAR-2.7.11b/source:$PATH

nextflow run nf-core/rnavar -r 1.2.1 \
  -profile singularity \
  --input /work/user/fmt116/TP_nextflow/projet_nextflow/sra_tools/input.csv \
  --fasta /work/user/fmt116/TP_nextflow/projet_nextflow/sra_tools/GCF_902167405.1_gadMor3.0_genomic.fna \
  --gtf /work/user/fmt116/TP_nextflow/projet_nextflow/sra_tools/genomic.gtf \
  --aligner star \
  --star_index /work/user/fmt116/TP_nextflow/projet_nextflow/sra_tools/star_index/ \
  --fastqc_threads 4 \
  --star_threads 12 \
  --read_length 150 \
  --outdir /work/user/fmt116/TP_nextflow/projet_nextflow/sra_tools/results_rnavar \
  --skip_baserecalibration \
  -resume
