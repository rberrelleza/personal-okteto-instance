export GCP_GKE_CLUSTER_NAME=
export GCP_REGION=
export GCP_PROJECT_NAME=
gcloud container clusters get-credentials $GCP_GKE_CLUSTER_NAME --region $GCP_REGION --project $GCP_PROJECT_NAME
kubectl port-forward -n okteto svc/grafana 8080:80