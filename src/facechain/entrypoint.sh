#!/bin/bash

set -Eeuo pipefail

function mount_file() {
  echo Mount $1 to $2

  SRC="$1"
  DST="$2"

  rm -rf "${DST}"

  if [ ! -f "${SRC}" ]; then 
    mkdir -pv "${SRC}"
  fi

  mkdir -pv "$(dirname "${DST}")"
  
  ln -sT "${SRC}" "${DST}"
}


NAS_DIR="/mnt/auto/facechain"
ROOT="/facechain"

declare -A MOUNTS

MOUNTS["/root"]="${NAS_DIR}/root"
MOUNTS["${ROOT}/worker_data"]="${NAS_DIR}/worker_data"
MOUNTS["/mnt/workspace"]="${NAS_DIR}/workspace"

for to_path in "${!MOUNTS[@]}"; do
  mount_file "${MOUNTS[${to_path}]}" "${to_path}"
done

if [ -f "/mnt/auto/sd/startup.sh" ]; then
  pushd ${ROOT}
  . /mnt/auto/sd/startup.sh
  popd
fi



python app.py
