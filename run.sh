#!/usr/bin/env bash

# MOUNT_DOWNLOAD_FOLDER=/root/Downloads
# mkdir -p ${MOUNT_DOWNLOAD_FOLDER}
# chmod -R 777 ${MOUNT_DOWNLOAD_FOLDER}

# GOOGLE_APPLICATION_CREDENTIALS=/root/cloud-run-secret.json gcsfuse sel_download "${MOUNT_DOWNLOAD_FOLDER}"

# touch ${MOUNT_DOWNLOAD_FOLDER}/connected.txt

nginx -c "/root/nginx.conf" &

/opt/bin/entry_point.sh
