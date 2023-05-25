export VERSION=${1:-1.8.1}
helm repo update
rm -rf okteto-${VERSION}.tgz
rm -rf okteto
helm pull  okteto/okteto --version ${VERSION} --devel
gunzip -c okteto-${VERSION}.tgz | tar xopf -