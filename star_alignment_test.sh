folder=./scratch/data/test
for file in $folder/*_1.fastq
do
    sample=`echo $file | grep -Eo 'SRR[0-9]{8}'`
    #sample= `awk -v FS="(/|_)" '{print $5}' $file | head -1`
    #`echo $file | sed -ic "\/.{3}\d{8}_"`
    #`echo $file | `grep '.{3}\d{8}'{1}`
    #`cut -d '_' -f 1 $file | head -1`
    #`awk -v FS="(/|_)" '{print $5}' | head -1 `
    #`cut -d '@' -f 5 $file | cut -d '.' -f 1 $file | head -1`
    #awk -v FS="(/|_)" '{print $5}' | head -1 `
    #cut -d '_' -f 1 $file | head -1
    R1_file=$folder/${sample}_1.fastq
    R1_file_alt=$file
    R2_file=`echo $file | tr '_1' '_2'`
    #R2_file=$folder/${sample}_2.fastq
    echo $sample
    echo $R1_file
    echo $R1_file_alt
    echo $R2_file
done