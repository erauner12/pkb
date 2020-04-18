#!/bin/bash
python index.py

# find all image excluding assets and styles dir and move them to ./images
find . -type d \( -name assets -o -name styles \) -prune -o -name "*.png" -exec mv "{}" ./images > /dev/null 2>&1 \;                     

# replace with "file"  and "png" from .org files
find . -type f -name "*.org" -exec sed -i 's/\[\[file/file/g' {} \;

# remove the "[[file" and "png]]" from .org files
find . -type f -name "*.org" -exec sed -i 's/png\]\]/png/g' {} \;

echo -e "\n\nfind and replace image paths with this:\nfile:../../images/\n"

grep -r "//wsl" . | grep -v update.sh | grep -v "<p><img" > change_file_paths.txt

grep --color=auto -A 1 -B 1 --group-separator======================== -r ".org:" change_file_paths.txt
echo -e "\n"
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


