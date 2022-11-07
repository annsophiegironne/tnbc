module load star/2.7.1a

set -eo pipefail

genome=/soft/bioinfo/genomes/species/Mus_musculus.GRCm38/genome/star_index/GencodeM24.STAR.v2.7.1a.sjdbOverhang99

for file in ./scratch/data/test
do
    echo "mapping $file"
    R1=
    time STAR --runMode alignReads \
        --genomeDir $genome \
        --readFilesIn $R1_files $R2_files \
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
        --outFileNamePrefix $file \
        --outSAMattributes NH HI AS NM MD \

mv $file* ./scratch/data/test
