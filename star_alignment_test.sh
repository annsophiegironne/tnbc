#genome=/soft/bioinfo/linux_RH7/mugqic_pipelines-2.2.0/resources/genomes/species/Mus_musculus.mm10
#genome=/soft/bioinfo/linux_RH7/mugqic_pipelines-2.2.0/resources/genomes/species/Homo_sapiens.GRCh38_92/genome/star_index/Gencode92.sjdbOverhang99
genome=/soft/bioinfo/genomes/species/Mus_musculus.GRCm38/genome/star_index/GencodeM24.STAR.v2.7.1a.sjdbOverhang99
R1_files=/u/gironnea/tnbc/scratch/data/fastq/SRR14071652_1.fastq
R2_files=/u/gironnea/tnbc/scratch/data/fastq/SRR14071652_2.fastq
READ_FILES=cat

STAR --runMode alignReads \
    --genomeDir $genome \
    --readFilesIn $R1_files $R2_files \
    --readFilesCommand $READ_FILES \
    --twopassMode Basic \
    --outStd Log \
    --outReadsUnmapped Fastx \
    --outFilterType BySJout \
    --outFilterMultimapNmax 20 \
    --outFilterMismatchNmax 999 \
    --outFilterMismatchNoverReadLmax 0.04 \
    --alignIntronMin 20 \
    --alignIntronMax 1000000 \
    --alignMatesGapMax 1000000 \
    --alignSJoverhangMin 8 \
    --alignSJDBoverhangMin 1 \
    --sjdbScore 1 \
    --runThreadN 8 \
    --limitBAMsortRAM 31532137230 \
    --outSAMtype BAM Unsorted \
    --outSAMunmapped Within \
    --quantMode TranscriptomeSAM GeneCounts \
    --outFileNamePrefix ./test \
    --outSAMattributes NH HI AS NM MD \
    --outSAMattrRGline ID:"001" 	PL:"ILLUMINA" 	 PU:"flowcell" 	 LB:"unknown" 	SM:"sample"     CN:"IRIC"

mv test* ./test
