doppler secrets download --format=env --no-file > okteto.env
source okteto.env

kubectl create secret  -n=okteto generic okteto-registry-secret \
--save-config \
--dry-run=client \
--from-literal=secretKey="okteto123" \
-o yaml | \
kubectl apply -n=okteto -f -