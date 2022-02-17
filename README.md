# Terraform Tips
This repository is for answering some of the common terraform questions on gcp infrastructure management using cloud build, github and terraform.
 - How to loop through list of item creation?
 - How to write conditional expression?
 - How to concatenate variables?
 - How to create resources like cloud storage buckets, pub/sub topics, service accounts and big query dataset?
Please follow along.


## Configuring **dev**
```bash
cd ../environments/dev
terraform init
terraform plan
terraform apply
terraform destroy
```
## Setting up GCP Project and Infra Bucket

```
gcloud services enable cloudbuild.googleapis.com compute.googleapis.com
PROJECT_ID=$(gcloud config get-value project)
gsutil mb gs://${PROJECT_ID}-bucket_name
gsutil versioning set on gs://${PROJECT_ID}-bucket_name
```

## Adding privileges to cloudbuild service account

```
CLOUDBUILD_SA="$(gcloud projects describe $PROJECT_ID \
    --format 'value(projectNumber)')@cloudbuild.gserviceaccount.com"
    
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$CLOUDBUILD_SA --role roles/editor
    
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$CLOUDBUILD_SA --role roles/bigquery.dataEditor
    
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member serviceAccount:$CLOUDBUILD_SA --role roles/iam.serviceAccountAdmin
```

## Updating terraform scripts with gcp project ID

```
cd ~/terraform-gcp
sed -i s/PROJECT_ID/$PROJECT_ID/g environments/*/terraform.tfvars
sed -i s/PROJECT_ID/$PROJECT_ID/g environments/*/backend.tf
```
