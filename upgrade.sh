doppler secrets download --format=env --no-file > okteto.env
source okteto.env

helm repo update
helm upgrade ramiro okteto/okteto --version "1.13.0-rc.1" -f values.yaml -n=okteto --devel \
    --set auth.openid.clientId=$OPENID_CLIENTID \
    --set auth.openid.endpoints.issuer=$OKTA_ISSUER \
    --set auth.openid.endpoints.authorization=$OKTA_AUTHORIZATION \
    --set cookie.hash=$COOKIE_HASH \
    --set cookie.secret=$COOKIE_SECRET \
    --set github.appId=$GITHUB_APPID \
    --set github.clientId=$GITHUB_CLIENTID \
    --set github.clientSecret=$GITHUB_CLIENTSECRET \
    --set github.installationUrl=$GITHUB_INSTALLATION_URL \
    --set privateRegistry.docker.password=$DOCKER_PASSWORD \
    --set privateRegistry.docker.user=$DOCKER_USER \
    --set cluster.endpoint=https://104.199.117.34

rm okteto.env
