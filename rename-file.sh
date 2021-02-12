#!/bin/bash

OIFS="$IFS"
IFS=$'\n'

echo "start finding the files..."

files=(`find . -type f -iname "*.en.*"`)
#echo $files

if [ -n  "$files" ]; then
	echo "start rename all the files..."
	
	for file in ${files[*]}; do
	    newFile="${file/en./}"
	    mv "$file" $newFile
	    echo "Rename file $file into $newFile"
	done
	
	echo "all the files have been renamed..."
else
	echo "File not found!!!"
fi

IFS="$OIFS"
