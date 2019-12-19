dropseq_dir=/net/data.isilon/ag-cherrmann/cramirez/Drop-seq/

## dowloading mouse genome fasta file
#base_url=ftp://ftp.ensembl.org/pub/release-98/fasta/mus_musculus/dna/
#file=Mus_musculus.GRCm38.dna.primary_assembly.fa.gz 
#wget --tries=5 $base_url$file 
#gunzip -d Mus_musculus.GRCm38.dna.primary_assembly.fa.gz 

#wget --tries=5 ftp://ftp.ensembl.org/pub/release-98/gtf/mus_musculus/Mus_musculus.GRCm38.98.gtf.gz 
#gunzip -d Mus_musculus.GRCm38.98.gtf.gz

## download picard tools
#wget https://github.com/broadinstitute/picard/releases/download/2.21.5/picard.jar \
#    -P inst/
#    --tries=3

java -jar inst/picard.jar FastqToSam \
       F1=$dropseq_dir/data/testing_data/SC_20180831A_BGHK_SNARE_cDNA_S1_R1_001.fastq.gz \
       F2=$dropseq_dir/data/testing_data/SC_20180831A_BGHK_SNARE_cDNA_S1_R2_001.fastq.gz \
       O=$dropseq_dir/data/bam/SC_20180831A_BGHK_SNARE_cDNA_S1.bam \
       SM=BGHK \
       RG=20180831A
       

