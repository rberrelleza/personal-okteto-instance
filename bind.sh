gcloud iam service-accounts add-iam-policy-binding \
  ramiro-okteto-me@okteto-demo-sandboxes.iam.gserviceaccount.com \
  --role roles/iam.workloadIdentityUser \
  --member "serviceAccount:okteto-demo-sandboxes.svc.id.goog[okteto/okteto-registry]" \
  --project okteto-demo-sandboxes