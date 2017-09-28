#!/bin/bash -v

source config.source

gcloud auth activate-service-account --key-file $GCLOUD_SA_KEY &&
gcloud config set compute/zone $GCLOUD_ZONE &&
gcloud config set compute/region $GCLOUD_REGION &&
gcloud config set project $GCLOUD_PROJECT &&
gcloud -q container clusters create $K8S_CLUSTER \
  --num-nodes=1 --cluster-version $K8S_VERSION --network "default" --username="admin" \
  --enable-cloud-logging --no-enable-cloud-monitoring --enable-legacy-authorization \
  --machine-type $GCLOUD_MACHINE_TYPE --image-type $GCLOUD_IMAGE_TYPE --disk-size $GCLOUD_DISK_SIZE \
  --scopes $GCLOUD_SCOPES &&
gcloud container clusters get-credentials $K8S_CLUSTER
