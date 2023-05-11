export VERSION=${1:-1.8.0-rc.9}
helm repo update
helm pull  okteto/okteto --version ${VERSION} --devel
gunzip -c okteto-${VERSION}.tgz | tar xopf -