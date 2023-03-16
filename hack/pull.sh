export VERSION=${1:-1.16-rc7}
helm pull  okteto/okteto --version ${VERSION} --devel
gunzip -c okteto-${VERSION}.tgz | tar xopf -