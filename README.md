# Containerized-cloudrun-template
This is a simple template for deploying containerized hello world fastapi application on cloudrun. Build can be streamlined by submitting `cloudbuild.yaml`


## To run locally
1. Build Docker container with the command: `docker build -t hello-world .`
2. Run Docker container with the command: `docker run -p 8080:8080 hello-world`

## Deploy to GCP


Before we run anything, we must first set the project with: `gcloud config set project dmnl-daas-development`

Then we create an Artifact Registry:
```
gcloud artifacts repositories create test \
    --repository-format=docker \
    --location=europe-west3
```

Finally, we submit the build:
```
gcloud builds submit --config=cloudbuild.yaml \
  --substitutions=_LOCATION="europe-west3",_REPOSITORY="test",_IMAGE="hello_world" .
```



