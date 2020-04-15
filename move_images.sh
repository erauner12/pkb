find ./lab -name "*.png" -exec mv "{}" ./images \;

# replace with "file"  and "png"
find ./lab -type f -name "*.org" -exec sed -i 's/\[\[file/file/g' {} \;

# remove the "[[file" and "png]]"
find ./lab -type f -name "*.org" -exec sed -i 's/png\]\]/png/g' {} \;

./update_org_files.sh


# remove windows path

# Needs to look like this
# file:../images/<filename>.png

# file:../images/

