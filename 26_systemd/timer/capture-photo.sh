#!/usr/bin/env bash
set -euf -o pipefail

if [[ ! -d "${CAPTURE_PATH}" ]]; then
    mkdir -p "${CAPTURE_PATH}"
else
    echo "Directory ${CAPTURE_PATH} exists"
fi

fswebcam --device /dev/video0 "${CAPTURE_PATH}/capture-$(date "+%Y%m%d-%H%M%S").jpg"  
