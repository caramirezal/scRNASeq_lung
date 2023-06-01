## Checking the integrity of the fastq files 

## dependencies
library(dplyr)
library(tibble)


## The fastq files were stored and unzipped in the following folder
path2fastq <- '/media/ag-cherrmann/cramirez/scRNASeq_lung/data/fastq/megan_lung_primary_scrnaseq/'

## md5 local check
md5localcheck <- read.table('/media/ag-cherrmann/cramirez/scRNASeq_lung/data/md5sum_local_check.txt', 
                            header = FALSE, sep = ' ')
md5localcheck <- md5localcheck %>% select(V1, V3) %>% rename(md5sum_local=V1, path=V3)
md5localcheck <- mutate(md5localcheck, file=gsub('.*\\/', '', path))

## Reading md5 checks
md5files <- list.files(path = path2fastq, pattern = 'md5$', recursive = TRUE, full.names = TRUE)
md5sum.list <- lapply(md5files, 
                      function(x) { 
                              df <- read.table(x) 
                              df <- rename(df, md5sum=V1, file=V2) 
                              df <- mutate(df, file=gsub('.*\\/', '', file))
                              return(df)
})
md5sum <- do.call(rbind, md5sum.list)

head(md5localcheck)
head(md5sum)

md5check.df <- merge(md5localcheck, md5sum)

if ( all(with(md5check.df, md5sum==md5sum_local)) == TRUE ) {
        print('Fastq integrity is OK :)')
}

