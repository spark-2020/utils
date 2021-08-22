#!/bin/sh

gcloud compute addresses delete tutorial-dev-vm-ip --region=asia-southeast1
gcloud compute firewall-rules delete allow-http
gcloud compute firewall-rules delete allow-https
