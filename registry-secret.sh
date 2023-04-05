source .env
kubectl create secret  -n=okteto generic okteto-registry-secret \
--save-config \
--dry-run=client \
--from-file=key=service.json \
-o yaml | \
kubectl apply -n=okteto -f -