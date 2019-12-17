./create_Drop-seq_reference_metadata.sh \
    -n test01 \
    -r /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/ref/Mus_musculus.GRCm38.dna.primary_assembly.fa \
    -s Mus_musculus \
    -g /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/ref/Mus_musculus.GRCm38.98.gtf \
    -a /media/ag-cherrmann/cramirez/STAR-2.7.3a/bin/Linux_x86_64/STAR \
    -b /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/ref/htslib-1.10.1/ \
    -d /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/Drop-seq_tools-2.3.0/ \
    -o out \
    -v
