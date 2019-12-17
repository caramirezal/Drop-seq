
## dowloading mouse genome fasta file
#base_url=ftp://ftp.ensembl.org/pub/release-98/fasta/mus_musculus/dna/
#file=Mus_musculus.GRCm38.dna.primary_assembly.fa.gz 
#wget --tries=5 $base_url$file 
#gunzip -d Mus_musculus.GRCm38.dna.primary_assembly.fa.gz 

#wget --tries=5 ftp://ftp.ensembl.org/pub/release-98/gtf/mus_musculus/Mus_musculus.GRCm38.98.gtf.gz 
#gunzip -d Mus_musculus.GRCm38.98.gtf.gz

./create_Drop-seq_reference_metadata.sh \
    -n test01 \
    -r /media/ag-cherrmann/cramirez/Drop-seq/ref/Mus_musculus.GRCm38.dna.primary_assembly.fa \
    -s Mus_musculus \
    -g /media/ag-cherrmann/cramirez/Drop-seq/ref/Mus_musculus.GRCm38.98.gtf \
    -a /media/ag-cherrmann/cramirez/STAR-2.7.3a/bin/Linux_x86_64/ \
    -b /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/ref/htslib-1.10.1/ \
    -v -e
