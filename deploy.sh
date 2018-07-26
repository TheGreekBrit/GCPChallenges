#!/bin/bash

SERVICE_ACCOUNT="challenge-user"
PROJECT_ID="intrepid-craft-195800"
SERVICE_ACCOUNT_EMAIL="$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com"

gcloud iam service-accounts create $SERVICE_ACCOUNT

gcloud iam service-accounts add-iam-policy-binding $SERVICE_ACCOUNT_EMAIL \
	--member="serviceAccount:$SERVICE_ACCOUNT_EMAIL" \
	--role='roles/owner'

gcloud iam service-accounts keys create client_secrets.json \
	--iam-account=$SERVICE_ACCOUNT@$PROJECT_ID.iam.gserviceaccount.com
