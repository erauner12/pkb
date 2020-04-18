#!/bin/bash
python index.py

# find all image excluding assets and styles dir and move them to ./images
find . -type d \( -name assets -o -name styles \) -prune -o -name "*.png" -exec mv "{}" ./images 2>&1 \;                     

# replace with "file"  and "png" from .org files
find . -type f -name "*.org" -exec sed -i 's/\[\[file/file/g' {} \;

# remove the "[[file" and "png]]" from .org files
find . -type f -name "*.org" -exec sed -i 's/png\]\]/png/g' {} \;

echo "\n\nfind and replace this on the following images:\nfile:../../images/"
grep -r "//wsl" .
read -rsp $'Press any key to continue...\n' -n1 key

# exports all org files to html
orgmk -r

# find all html files and do not incude this directory or the two other below it and insert jekyll matters title so it can be searched
find . -mindepth 3 -regex ".*\.\(html\)" -type f | xargs sed -i '1 i\---\ntitle: "result"\n--- '

# | cat - {} > {} \;

####### write a script that finds instances of pictures you need to find and replace on within the lines before you commit



git add -A
git commit -m "Regular update"
git push



grep -r "//wsl" .

