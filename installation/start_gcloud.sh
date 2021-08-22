#!/bin/sh

gcloud compute addresses create tutorial-dev-vm-ip \
--project=teak-optics-318708 \
--network-tier=STANDARD \
--region=asia-southeast1

gcloud compute firewall-rules create allow-http \
--project=teak-optics-318708 \
--direction=INGRESS \
--network=default \
--action=ALLOW \
--rules=tcp:80 \
--source-ranges=0.0.0.0/0 \
--target-tags=http-server

IP_ADDRESS_DEV_MACHINE=$(gcloud compute addresses list --filter="name='tutorial-dev-vm-ip' AND region:asia-southeast1" --format="value(address_range())")

gcloud compute instances create tutorial-dev-vm \
--project=teak-optics-318708 \
--zone=asia-southeast1-a \
--machine-type=n1-standard-2 \
--preemptible \
--image=ubuntu-1804-bionic-v20210817 \
--image-project=ubuntu-os-cloud \
--boot-disk-size=10GB \
--boot-disk-type=pd-standard \
--boot-disk-device-name=tutorial-dev-vm \
--metadata-from-file startup-script=tutorial-dev-machine.sh \
--network-tier=STANDARD \
--address=$IP_ADDRESS_DEV_MACHINE \
--subnet=default \
--tags=http-server,https-server \
--labels=os=ubuntu-18-04-lts,cost-alloc=tutorials,usage=golang,configuration=v1-1-0