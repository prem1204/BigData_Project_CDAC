#! /bin/sh

dataFile=$1

echo "Downloading data from S3..."

aws s3 cp $dataFile .

mkdir data

mv ./*.zip data/

cd data

echo "Extracting Data..."

#tar -xvzf 2021*.zip ./data/
unzip ./*.zip 

ls

rm -rf ./*zip

echo "Move data to HDFS..."

hdfs dfs -mkdir data

hdfs dfs -put * data/

hdfs dfs -ls data/
