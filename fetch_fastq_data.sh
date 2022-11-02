accessions=$(cat SraAccList.txt)
for id in $accessions
do
    time fasterq-dump -vp -e 32 $id
done

mkdir fastq
mv *.fastq fastq