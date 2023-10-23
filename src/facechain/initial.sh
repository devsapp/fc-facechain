#!/bin/sh

URL="https://fc-facechain-cn-shanghai.oss-cn-shanghai-internal.aliyuncs.com"
TARGET="/mnt/auto/facechain"

files="$(curl "${URL}/files.list")"

# 提前创建文件夹，避免由于并发创文件夹导致报错
echo "$files" | xargs -I {} dirname {} | xargs -I {} mkdir -p "${TARGET}/{}"

echo "$files" | xargs -P32 -I {} /initial/aria2c -x 16 -s 16 --allow-overwrite=true -c "${URL}/{}" --dir "${TARGET}"  --out "{}" --console-log-level=error
# echo "$files" | xargs -P256 -I {} ./mwget "${URL}/{}" -n 64 -f "{}"
# echo "$files" | xargs -P16 -I {} ./ossutil64 -f -u --parallel 32 -e "https://oss-cn-shanghai-internal.aliyuncs.com" -i "${accessKeyID}" -k "${accessKeySecret}" -t "${securityToken}" cp oss://fc-facechain-cn-shanghai/{} "${TARGET}/{}"