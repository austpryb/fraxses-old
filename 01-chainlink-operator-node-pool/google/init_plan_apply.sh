#!/bin/bash

# Useful commands for Terraform if you have successfully exported environment variables
# Or Manually set your environment variables
export $PROJECT_ID=""
export $SA_EMAIL=""
export $CLUSTER_NAME=""
export $GCP_REGION=""
export $GCP_ZONE=""
export SSH_EMAIL=$SSH_EMAIL
export USER_EMAIL=$USER_EMAIL
export SSH_KEY=$SSH_KEY

 terraform init 

#terraform destroy -var project_id=$PROJECT_ID \
#    -var sa_email=$SA_EMAIL \
#    -var cluster_name=$CLUSTER_NAME \
#    -var gcp_region=$GCP_REGION \
#    -var gcp_zone=$GCP_ZONE \
#    -var user_email=$USER_EMAIL \
#    -var ssh_key="$SSH_KEY" \
#    -var node_username=$USER_EMAIL \
#    -var eth_url_kovan=$ETH_URL_KOVAN

terraform plan -var project_id=$PROJECT_ID \
    -var sa_email=$SA_EMAIL \ 
    -var cluster_name=$CLUSTER_NAME \
    -var gcp_region=$GCP_REGION \
    -var gcp_zone=$GCP_ZONE \
    -var user_email=$USER_EMAIL \
    -var ssh_key="$SSH_KEY" \
    -var node_username=$USER_EMAIL \
    -var eth_url_kovan=$ETH_URL_KOVAN

terraform apply -var project_id=$PROJECT_ID \
    -var sa_email=$SA_EMAIL \
    -var cluster_name=$CLUSTER_NAME \
    -var gcp_region=$GCP_REGION \
    -var gcp_zone=$GCP_ZONE \
    -var user_email=$USER_EMAIL \
    -var ssh_key="$SSH_KEY" \
    -var node_username=$USER_EMAIL \
    -var eth_url_kovan=$ETH_URL_KOVAN

# This creates a Kube config at ${HOME}/.kube/config
# Make sure your docker-compose has a volume mounted here or else you will have to copy and paste the Kube config to your local
# If you generate a kube config in the docker container and Lens refuses to authenticate just run the get-credentials command from your local shell 
# run "cat ~/.kube/config" if you want to paste as text
gcloud container clusters get-credentials chainlink-node-pool-cluster --zone $GCP_ZONE --project chainlink-node-pool
