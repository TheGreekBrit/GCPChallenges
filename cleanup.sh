#!/bin/bash

SERVICE_ACCOUNT="challenge-user"
PROJECT_ID="intrepid-craft-195800"

gcloud iam service-accounts delete $SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com

rm -f client_secrets.json
