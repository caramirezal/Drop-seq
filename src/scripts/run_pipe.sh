
## paths and dependencies
base_dir=/net/data.isilon/ag-cherrmann/cramirez/Drop-seq/

## indexing and reference metadata construction
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

## performing alignement
#bash $base_dir/src/scripts/Drop-seq_alignment.sh \
#     -g $base_dir/data/metadata/STAR/ \
#     -r $base_dir/data/metadata/data_int.fasta \
#     -d $base_dir/inst/Drop-seq_tools-2.3.0/ \
#     -o $base_dir/data/out/ \
#     -t $base_dir/data/temp_dir/ \
#     -s $base_dir/inst/STAR-2.7.3a/bin/Linux_x86_64/STAR \
#     $base_dir/data/bam/SC_20180831A_BGHK_SNARE_cDNA_S1.bam 

## creating digital expression matrix
bash $base_dir/inst/Drop-seq_tools-2.3.0/DigitalExpression \
      I=$base_dir/data/out/final.bam \
      O=$base_dir/data/matrix.mtx.gz \
      SUMMARY=out_gene_exon_tagged.dge.summary.txt \
      NUM_CORE_BARCODES=100

