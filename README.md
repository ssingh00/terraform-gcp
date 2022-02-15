# Terraform Tips

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

## Adding Privileges to cloudbuild service account

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

```
cd ~/terraform-gcp
sed -i s/PROJECT_ID/$PROJECT_ID/g environments/*/terraform.tfvars
sed -i s/PROJECT_ID/$PROJECT_ID/g environments/*/backend.tf
```
