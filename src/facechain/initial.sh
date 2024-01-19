#!/bin/sh
REGION_SUFFIX=$(echo "$FC_REGION" | awk -F- '{print $2}')
URL="https://sdmodel-${REGION_SUFFIX}.oss-${FC_REGION}-internal.aliyuncs.com"
TARGET="/${NAS_ROOT}/facechain"
VERSION=v2
OSS_PREFIX=facechain/${VERSION}

files="$(curl "${URL}/${OSS_PREFIX}/files.list")"

# 提前创建文件夹，避免由于并发创文件夹导致报错
echo "$files" | xargs -I {} dirname {} | xargs -I {} mkdir -p "${TARGET}/{}"

echo "$files" | xargs -P32 -I {} /initial/aria2c -x 16 -s 16 --allow-overwrite=true -c "${URL}/${OSS_PREFIX}/{}" --dir "${TARGET}"  --out "{}" --console-log-level=error
# echo "$files" | xargs -P256 -I {} ./mwget "${URL}/{}" -n 64 -f "{}"
# echo "$files" | xargs -P16 -I {} ./ossutil64 -f -u --parallel 32 -e "https://oss-cn-shanghai-internal.aliyuncs.com" -i "${accessKeyID}" -k "${accessKeySecret}" -t "${securityToken}" cp oss://fc-facechain-cn-shanghai/{} "${TARGET}/{}"