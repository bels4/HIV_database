#!/bin/bash

FLAG=$1
DIR=$2
PREFIX=$3
BEGIN=$4
END=$5

case $FLAG in
	-gb)
		echo "Starting to work"
		
		if [ ! -d "$DIR" ]
		then
			mkdir $DIR
		fi

		echo "Downloading from GenBank"

		for (( VAR=$BEGIN; VAR<=$END; VAR++ ))
		do
			echo "Downloading file $PREFIX$VAR.gb"
			touch $DIR/$PREFIX$VAR.gb
			efetch -db nucleotide -format gb -id $PREFIX$VAR > $DIR/$PREFIX$VAR.gb
		done
	;;
	-lanl)
		echo "Starting to work"
		
		if [ ! -d "$DIR" ]
		then
			mkdir $DIR
		fi

		echo "Downlaoding from HIV LANL"

		for (( VAR=$BEGIN; VAR<=$END; VAR++ ))
		do
			echo "Downloading file $PREFIX$VAR.gb"
			touch $DIR/$PREFIX$VAR.gb
			wget -nv -O "$DIR/$PREFIX$VAR.gb" "https://www.hiv.lanl.gov/tmp/argo/CdMDCjY_/$PREFIX$VAR-new1.gb"
		done
	;;
	*)
		cat < help.txt 
	;;
esac
