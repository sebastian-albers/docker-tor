#!/bin/bash

set -eou pipefail

tag=$1

# install manifest-tool
if [ ! -f manifest-tool ] ; then
  curl -Lo manifest-tool https://github.com/estesp/manifest-tool/releases/download/v1.0.0/manifest-tool-linux-amd64
  chmod +x manifest-tool
fi

# create multi-arch manifest from template
cp multi-arch-manifest.yaml "multi-arch-manifest-${tag}.yaml"
sed -i'' "s|__TAG__|${tag}|g" "multi-arch-manifest-${tag}.yaml"
./manifest-tool push from-spec "multi-arch-manifest-${tag}.yaml"

