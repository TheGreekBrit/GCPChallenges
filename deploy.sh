#!/bin/bash
terraform apply -auto-approve deploy/app		# deploy app to gce
mv terraform.tfstate{,.tmp} 	# ignore some resouces for a minute
gcloud compute instances stop flask-instance #&& gcloud compute images create flask-image --source-disk flask-instance
terraform apply deploy/infra 	# create image, deploy MIG/LB/etc
mv terraform.tfstate{.tmp,}
