#!/bin/bash

### Check if draw directory exists ###

# Set script dir --> https://stackoverflow.com/questions/24112727/relative-paths-based-on-file-location-instead-of-current-working-directory
scriptDir=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# If not exists, exit
if [ ! -d "$scriptDir/draws" ] 
then
    echo "Directory draws does not exists on script path" 
    exit 1 # stop
fi

# Set draws path
drawsPath="$scriptDir/draws" 

# Get draws number
drawsNum=$( ls $drawsPath | wc -l )

# If no draw is found, exit
if [ $drawsNum -lt 1 ] 
then
    echo "No draws found on draws folder" 
    exit 1 # stop
fi

# Get random draw path --> https://stackoverflow.com/questions/414164/how-can-i-select-random-files-from-a-directory-in-bash
randomDrawPath=$(find $drawsPath -type f | shuf -n 1)

# Print draw line by line --> https://linuxize.com/post/how-to-read-a-file-line-by-line-in-bash/
while IFS= read -r line
do
  echo "$line"
done < $randomDrawPath

# Add blank line
echo ""

exit 1
