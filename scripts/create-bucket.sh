#!/bin/sh

source ../.env

# (!!) Change default password
MINIO_NET="dsw-inrae-deployment_default"
MINIO_BUCKET="engine-wizard"

sudo docker run --rm --net $MINIO_NET \
  -e MINIO_BUCKET=$MINIO_BUCKET \
  -e MINIO_USER="$MINIO_ROOT_USER" \
  -e MINIO_PASS="$MINIO_ROOT_PASSWORD" \
  --entrypoint sh minio/mc -c "\
  mc config host add dswminio http://minio:9000 \$MINIO_USER \$MINIO_PASS && \
  mc mb dswminio/\$MINIO_BUCKET
"