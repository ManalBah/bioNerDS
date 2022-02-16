#!/bin/sh
 
#  Script.sh
#  

SourceDir=../BioNerDS_2020/source_docs
CONFIG_FILE=../BioNerDS_2020/properties.conf
TARGET_KEY="out-normal"

echo "The script starts now."


for file in "$SourceDir"/*
do
echo "------------------"
echo "$file" 
filename=$(basename -- "$file")
echo "$filename" 
REPLACEMENT_VALUE="../BioNerDS_2020/out/${filename}"
echo "$REPLACEMENT_VALUE" 
sed -i "s|\($TARGET_KEY *= *\).*|\1$REPLACEMENT_VALUE|" $CONFIG_FILE
java -Xms8G -Xmx8G -jar bionerds-1.0-SNAPSHOT-jar-with-dependencies.jar --properties properties.conf --text $file
done
