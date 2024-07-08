# Add the repository
helm repo add tailscale https://pkgs.tailscale.com/helmcharts

# Update your client’s package list
helm repo update

source .env

helm upgrade --install tailscale-operator tailscale/tailscale-operator \
  --namespace=tailscale \
  --create-namespace \
  --set-string oauth.clientId=$TS_CLIENT_ID \
  --set-string oauth.clientSecret=$TS_CLIENT_SECRET \
  --wait
