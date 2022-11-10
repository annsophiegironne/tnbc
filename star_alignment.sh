module load star/2.7.1a

set -eo pipefail

genome=/soft/bioinfo/genomes/species/Mus_musculus.GRCm38/genome/star_index/GencodeM24.STAR.v2.7.1a.sjdbOverhang99
folder=/u/gironnea/tnbc/scratch/data/fastq
output=/u/gironnea/tnbc/scratch/data/bam

for file in $folder/*_1.fastq
do
    sample=`echo $file | grep -Eo 'SRR[0-9]{8}'`
    R1_file=$folder/${sample}_1.fastq
    R2_file=$folder/${sample}_2.fastq
    echo "mapping $sample"
    
    mkdir $output/$sample
    
    time STAR --runMode alignReads \
        --genomeDir $genome \
        --readFilesIn $R1_file $R2_file \
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
        --outFileNamePrefix ${sample}_ \
        --outSAMattributes NH HI AS NM MD \
        > $output/$sample/$sample.log
    
    echo "moving the files"
    mv ${sample}_* $output/$sample
done

#si ca plante regarder si fichiers non vides deja presents pour pouvoir relancer direct :)
#inclure fetch maybe yay