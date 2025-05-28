#!/bin/bash

export GCP_PROJECT_ID="preview-deployments-460708"
export GCP_REGION="us-central-1"
export GCP_AR_NAME="preview-deployments"
export GCP_AR_REPOSITORY_NAME="aliakseimalyshau/preview-deployment"

export RANDOM_SHORT_SHA=$(openssl rand -hex 4 | rev | cut -c2- | rev)

echo Short SHA: $RANDOM_SHORT_SHA

docker build \
    -t $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$GCP_AR_NAME/$GCP_AR_REPOSITORY_NAME:$RANDOM_SHORT_SHA

docker push $GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$GCP_AR_NAME/$GCP_AR_REPOSITORY_NAME:$RANDOM_SHORT_SHA

echo Done
