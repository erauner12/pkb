#!/bin/bash
python index.py

# combine to get multiple directories and execute. excluding assets and styles dir
find . -type d \( -name assets -o -name styles \) -prune -o -name "*.png" -exec mv "{}" ./images \;                     

# replace with "file"  and "png" from .org files
find . -type f -name "*.org" -exec sed -i 's/\[\[file/file/g' {} \;

# remove the "[[file" and "png]]" from .org files
find . -type f -name "*.org" -exec sed -i 's/png\]\]/png/g' {} \;

# exports all org files to html
orgmk -r

# find all html files and do not incude this directory or the two other below it and 
#find . -mindepth 3 -name '*.html' -print 


####### write a script that finds instances of pictures you need to find and replace on within the lines before you commit



git add -A
git commit -m "Regular update"
git push




#echo "$(echo 'task goes here' | cat - todo.txt)" > todo.txt