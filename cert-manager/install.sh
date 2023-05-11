helm upgrade --install \
  cert-manager jetstack/cert-manager \
  --namespace okteto \
  --version v1.11.2 \
  --set installCRDs=true \
  --set global.podSecurityPolicy.enabled=true
