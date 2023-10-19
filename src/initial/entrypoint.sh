#!/bin/sh

URL="https://fc-facechain-cn-shanghai.oss-cn-shanghai-internal.aliyuncs.com"
TARGET="/mnt/auto/facechain"

files="$(curl "${URL}/files.list")"

# 提前创建文件夹，避免由于并发创文件夹导致报错
echo "$files" | xargs -I {} dirname {} | xargs -I {} mkdir -p "${TARGET}/{}"

echo "$files" | xargs -P256 -I {} ./aria2c -x 256 -s 256 --allow-overwrite=true -c "${URL}/{}" --dir "${TARGET}"  --out "{}"