gunzip -c $1 > ~/my_project/Scratch/unzipped.gff

#change into the scratch folder. We will produce all our temporary files here
cd ~/my_project/Scratch/

sed '1,8d' unzipped.gff | cut -d$'\t' -f 7 | cut -d ';' -f 5 | sed 's/gene=/''/g' > geneName.gff 
sed '1,8d' unzipped.gff | cut -f 3-5 | paste -d '\t' - geneName.gff > ~/my_project/Data/output.gff

rm geneName.gff
rm unzipped.gff

echo 'Done!'