#!/bin/sh

gcloud compute instances update tutorial-dev-vm --no-deletion-protection -q --zone asia-southeast1-a
gcloud compute instances delete tutorial-dev-vm -q --zone asia-southeast1-a
gcloud compute addresses delete tutorial-dev-vm-ip --region=asia-southeast1 -q
gcloud compute firewall-rules delete allow-http -q
gcloud compute firewall-rules delete allow-https -q
