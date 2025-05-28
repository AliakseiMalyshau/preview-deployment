#!/bin/bash

export GCP_PROJECT_ID="preview-deployments-460708"
export GCP_REGION="us-central-1"
export GCP_AR_NAME="preview-deployments"
export GCP_AR_REPOSITORY_NAME="aliakseimalyshau/preview-deployment"

echo Pull request number:
read PR_NUMBER

# Cleanup
for svc in $(gcloud run services list \
    --region $GCP_REGION \
    --project $GCP_PROJECT_ID \
    --filter="metadata.name~preview-$GCP_AR_REPOSITORY_NAME-pr$PR_NUMBER" \
    --format="value(metadata.name)"); do
    gcloud run services delete $svc \
        --region $GCP_REGION \
        --project $GCP_PROJECT_ID \
        --quiet
done
