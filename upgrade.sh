doppler secrets download --format=env --no-file > okteto.env
source okteto.env

export OKTA_AUTHORIZATION=https://ramiro-okteto-dev.auth.us-west-2.amazoncognito.com/oauth2/authorize
export OKTA_ISSUER=https://cognito-idp.us-west-2.amazonaws.com/us-west-2_99NG6XKKa
export OPENID_CLIENTID=37pjkh9fefgj17iisbp7p9gqbf

helm repo update
helm upgrade ramiro okteto/okteto --version "1.23.2" -f values.yaml -n=okteto --devel \
    --set auth.openid.clientId=$OPENID_CLIENTID \
    --set auth.openid.endpoints.issuer=$OKTA_ISSUER \
    --set auth.openid.endpoints.authorization=$OKTA_AUTHORIZATION \
    --set cookie.hash=$COOKIE_HASH \
    --set cookie.secret=$COOKIE_SECRET \
    --set github.appId=$GITHUB_APPID \
    --set github.clientId=$GITHUB_CLIENTID \
    --set github.clientSecret=$GITHUB_CLIENTSECRET \
    --set github.installationUrl=$GITHUB_INSTALLATION_URL \
    --set insights.enabled=true \
    --set insights.bearerSecret.key=ramiro

rm okteto.env
