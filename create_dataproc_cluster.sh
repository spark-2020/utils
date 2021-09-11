#!/bin/sh

#git clone https://github.com/spark-2020/utils.git

#git clone https://github.com/GoogleCloudDataproc/initialization-actions.git

REGION='us-central1'
CLUSTER_NAME='test-wordcount'
gcloud dataproc clusters create ${CLUSTER_NAME} \
    --optional-components=ANACONDA,JUPYTER \
    --enable-component-gateway \
    --image-version=1.5-ubuntu18 \
    --region=${REGION} \
    --initialization-actions=gs://goog-dataproc-initialization-actions-${REGION}/connectors/connectors.sh \
    --metadata GCS_CONNECTOR_VERSION=2.2.2 \
    --metadata bigquery-connector-version=1.2.0 \
    --metadata spark-bigquery-connector-version=0.21.0 \
    
    