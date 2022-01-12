#!/bin/sh

rm -rf public
git submodule init
git submodule update
hugo

# why are the pictures being rotated??
for f in $(find public/img -type f \( -iname \*.jpg -o -iname \*.JPG -o -iname \*.PNG -o -iname \*.png \))
do
        PICTURE_NAME="$(basename $f)"
        PICTURE_PATH=$(dirname $f)
        ffmpeg -loglevel 2 -i $f -q:v 2 "${PICTURE_PATH}/${PICTURE_NAME}" -y
done

cp favicons/* public

public_size=$(du -s public/ | cut -f1)
resources_size=$(du -s resources/ | cut -f1)
published_size=$(( public_size + resources_size ))
echo "${published_size}"

max_published_size=300000
if [ "$published_size" -ge "$max_published_size" ]; then
    echo "The generated site is too big!"
fi
