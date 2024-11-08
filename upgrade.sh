helm repo update
helm upgrade okteto okteto/okteto --version "1.26.0" -f config.yaml -n=okteto --devel
