[![en](https://img.shields.io/badge/lang-en-red.svg)](./README.en.md)
[![pt-br](https://img.shields.io/badge/lang-pt--br-green.svg)](./README.md)

# Setup

Authenticate to GCP to set up the environment:
```
gcloud auth application-default login
```

# Project

This stack sets up the basic infrastructure in the Google cloud and implements all our applications.

## Requirements

To create the environment or modify any configuration you need to have the following tools installed.

- [google-cloud-sdk](https://cloud.google.com/sdk/docs/install)
- [terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [helm](https://helm.sh/docs/intro/install/)
- [git](https://github.com/git-guides/install-git)
- [fluxcd](https://fluxcd.io/flux/installation/)
- [restic](https://restic.readthedocs.io/en/stable/020_installation.html)
- [vault](https://www.vaultproject.io/docs/install)
- [kite](https://github.com/dxxr-global/opx)
- [kaigara](https://github.com/dxxr-global/kaigara)

## Requirements

Before creating the resources with terraform, you need to prepare the environment by creating a bucket to save the terraform state and enable some apis services in GCP

```
cd config-init
terraform init
terraform apply
```

Get private key from terraform service account
```
terraform output gsa_private_key_terraform | sed s/\"//g| base64 -d
```

# NOT NECESSARY
Set GCP parameters for the project:
```
GCP_PROJECT_ID="kanastra-alpha1"
GCP_PROJECT_NAME="JayLabs - Kanastra Challenge"
```

Create GCP project:
```
gcloud projects create $GCP_PROJECT_ID --name="$GCP_PROJECT_NAME"
```

Set up the project:
```
gcloud config set project $GCP_PROJECT_ID
```

Link billing account (0X0X0X-0X0X0X-0X0X0X)
```
gcloud alpha billing accounts list
gcloud beta billing accounts list

gcloud alpha billing accounts projects link $GCP_PROJECT_ID --billing-account=01AC6F-A322D6-0034CE
```





Create terraform service account:
```
gcloud iam service-accounts create $GCP_SA_TF_ID \
--display-name="$GCP_SA_TF_NAME" \
--description="$GCP_SA_TF_DESCRIPTION"
```

Set required roles and permissions for terraform service account
```
gcloud projects add-iam-policy-binding $GCP_PROJECT_ID \
--member="serviceAccount:$GCP_SA_TF_ID@$GCP_PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/editor"
```

// TODO
**Disclaimer**: In the scenario where I would have to configure a specific service I would set the necessary roles and permissions for the terraform service account.

Example: The service account will have the Kubernetes cluster admin role

```
gcloud projects add-iam-policy-binding $GCP_PROJECT_ID \
--member="serviceAccount:$GCP_SA_TF_ID@$GCP_PROJECT_ID.iam.gserviceaccount.com" \
--role="roles/container.admin"
```

But in this project where I'm provisioning all the infrastructure with this service account, then the service account will be assigned the editor role for this project.


```
gcloud iam service-accounts get-iam-policy $GCP_SA_TF_ID@$GCP_PROJECT_ID.iam.gserviceaccount.com \
--format=json > policy.json
```# kanastra-challenge


Loki Dashboard

13639