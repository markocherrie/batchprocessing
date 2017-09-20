#!/bin/bash
cd C:/Users/mcherrie/batchprocessing/rawdata
gzip -d *.gz
rm *.gz 
FILES=*
for f in $FILES; 
do
perl ../go.pl < "$f" > ../convert/$f.txt
echo "Extracting $f..."
rm "$f"
done 



