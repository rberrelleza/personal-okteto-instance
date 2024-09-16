#doppler secrets download --format=env --no-file > okteto.env
#source okteto.env

helm repo update
helm upgrade okteto okteto/okteto --version "1.24.2" -f config.yaml -n=okteto --devel
#rm okteto.env
