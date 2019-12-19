## command that works in curry cluster
#./create_Drop-seq_reference_metadata.sh \
#    -n test01 \
#    -r /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/ref/Mus_musculus.GRCm38.dna.primary_assembly.fa \
#    -s Mus_musculus \
#    -g /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/ref/Mus_musculus.GRCm38.98.gtf \
#    -a /media/ag-cherrmann/cramirez/STAR-2.7.3a/bin/Linux_x86_64/STAR \
#    -b /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/ref/htslib-1.10.1/ \
#    -d /media/ag-cherrmann/cramirez/Drop-seq/src/scripts/Drop-seq_tools-2.3.0/ \
#    -o out \
#    -v

#export JAVA_HOME=/net/data.isilon/ag-cherrmann/cramirez/miniconda3/envs/dropseq/jre/bin/
#export PATH=$JAVA_HOME/bin:$PATH

base_dir=/net/data.isilon/ag-cherrmann/cramirez/Drop-seq/

## command for bioquant cluster
#bash $base_dir/src/scripts/create_Drop-seq_reference_metadata.sh \
#    -n data_int \
#    -r $base_dir/data/ref/Mus_musculus.GRCm38.dna.primary_assembly.fa \
#    -s Mus_musculus \
#    -g $base_dir/data/ref/Mus_musculus.GRCm38.98.gtf \
#    -a $base_dir/inst/STAR-2.7.3a/bin/Linux_x86_64/STAR \
#    -b $base_dir/inst/htslib-1.10.1/ \
#    -d $base_dir/inst/Drop-seq_tools-2.3.0/ \
#    -o $base_dir/data/metadata/ \
#    -i $base_dir/inst/samtools-1.10/
#    -v


bash $base_dir/src/scripts/Drop-seq_alignment.sh \
     -g $base_dir/data/metadata/STAR/ \
     -r $base_dir/data/metadata/data_int.fa \
     -d $base_dir/inst/Drop-seq_tools-2.3.0/ \
     -o $base_dir/data/out/ \
     -t $base_dir/data/temp_dir/ \
     -s $base_dir/inst/STAR-2.7.3a/bin/Linux_x86_64/STAR \
     $base_dir/data/bam/SC_20180831A_BGHK_SNARE_cDNA_S1.bam 



