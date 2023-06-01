## This script contains the commands to run the kallisto pipeline on scRNASeq data
## from lung cells treated with interferon


## Create and and activate a conda environment containing kallisto
#conda create --name kallisto python=3.8 kb-python
#conda activate kallisto


## Initial settings
INDEX='/media/ag-cherrmann/cramirez/scRNASeq_organoids/data/kallistoIndex/index.idx'
GENO='/media/ag-cherrmann/cramirez/scRNASeq_organoids/data/kallistoIndex/t2g.txt'
OUTDIR='/media/ag-cherrmann/cramirez/scRNASeq_lung/data/kallisto_counts'
PATH2FASTQS='/media/ag-cherrmann/cramirez/scRNASeq_lung/data/fastq/megan_lung_primary_scrnaseq'


#ls $PATH2FASTQS | grep -v html | xargs -I{} mkdir $OUTDIR'/'{}
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_broch-betaandlam' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_broch-betaandlam/MES01_broch-betaandlam_R1_001.fastq.gz' $PATH2FASTQS'/MES01_broch-betaandlam/MES01_broch-betaandlam_R2_001.fastq.gz'
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_broch-lam/' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_broch-lam/MES01_broch-lam_R1_001.fastq.gz' $PATH2FASTQS'/MES01_broch-lam/MES01_broch-lam_R2_001.fastq.gz'
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_bronch-beta' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_bronch-beta/MES01_bronch-beta_R1_001.fastq.gz' $PATH2FASTQS'/MES01_bronch-beta/MES01_bronch-beta_R2_001.fastq.gz'
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_bronch-mock' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_bronch-mock/MES01_bronch-mock_R1_001.fastq.gz' $PATH2FASTQS'/MES01_bronch-mock/MES01_bronch-mock_R2_001.fastq.gz'
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_nasal-beta' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_nasal-beta/MES01_nasal-beta_R1_001.fastq.gz' $PATH2FASTQS'/MES01_nasal-beta/MES01_nasal-beta_R2_001.fastq.gz'
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_nasal-betanandlam' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_nasal-betanandlam/MES01_nasal-betanandlam_R1_001.fastq.gz' $PATH2FASTQS'/MES01_nasal-betanandlam/MES01_nasal-betanandlam_R2_001.fastq.gz'
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_nasal-lam' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_nasal-lam/MES01_nasal-lam_R1_001.fastq.gz' $PATH2FASTQS'/MES01_nasal-lam/MES01_nasal-lam_R2_001.fastq.gz'
kb count -i $INDEX --keep-tmp -g $GENO -o $OUTDIR'/MES01_nasal-mock' -x 10xv3 -t 15 --verbose $PATH2FASTQS'/MES01_nasal-mock/MMES01_nasal-mock_R1_001.fastq.gz' $PATH2FASTQS'/MES01_nasal-mock/MES01_nasal-mock_R2_001.fastq.gz'