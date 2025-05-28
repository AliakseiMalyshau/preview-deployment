#!/bin/bash

export GCP_PROJECT_ID="preview-deployments-460708"
export GCP_REGION="us-central-1"
export GCP_AR_NAME="preview-deployments"
export GCP_AR_REPOSITORY_NAME="aliakseimalyshau/preview-deployment"

echo Short SHA:
read SHORT_SHA

echo Pull request number:
read PR_NUMBER

# Deploy
gcloud run deploy preview-$GCP_AR_REPOSITORY_NAME-pr$PR_NUMBER-$SHORT_SHA \
    --region $GCP_REGION \
    --project $GCP_PROJECT_ID \
    --image=$GCP_REGION-docker.pkg.dev/$GCP_PROJECT_ID/$GCP_AR_NAME/$GCP_AR_REPOSITORY_NAME:$SHORT_SHA \
    --port=8000 \
    --ingress=all \
    --allow-unauthenticated
