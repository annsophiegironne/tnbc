folder=./scratch/data/test
for file in $folder/*.fastq
do
    sample=`echo $file | awk -v FS="(/|_)" '{print $5}' | head`
    #cut -d '_' -f 1 $file | head -1
    #R1_file=`echo ${sample}_1.fastq`
    #R2_file=`echo ${sample}_2.fastq`
    echo $sample
done