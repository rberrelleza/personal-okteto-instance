source .env
kubectl create secret  -n=okteto generic okteto-cloud-secret \
--save-config \
--dry-run=client \
--from-literal=OKTETO_LICENSE=$OKTETO_LICENSE \
--from-literal=GITHUB_CLIENTSECRET=$GITHUB_CLIENTSECRET \
--from-literal=OPENID_CLIENTSECRET=$OPENID_CLIENTSECRET \
--from-literal=GITHUB_INTEGRATION_CLIENTSECRET=$GITHUB_CLIENTSECRET \
--from-file=GITHUB_APP_PRIVATE_KEY=github.key \
-o yaml | \
kubectl apply -n=okteto -f -