#!/bin/bash

SERVICE_ACCOUNT="challenge-user"
PROJECT_ID="intrepid-craft-195800"

gcloud iam service-accounts create $SERVICE_ACCOUNT

gcloud iam service-accounts keys create client_secrets.json \
	--iam-account=$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com
