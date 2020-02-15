#!/bin/bash

set -eou pipefail

version=$1
current_version=
tags=

# split version and create tags, e.g. 1.2.3.4 => '1', '1.2', '1.2.3', '1.2.3.4'
IFS='.' read -ra PART <<< "$version"
for i in "${PART[@]}"; do
  if [ -z "${current_version}" ] ; then
    current_version="${i}"
  else
    current_version="${current_version}.${i}"
  fi
  if [ -z "${tags}" ] ; then
    tags="'${current_version}'"
  else
    tags="${tags}, '${current_version}'"
  fi
done

# install manifest-tool
if [ ! -f manifest-tool ] ; then
  curl -Lo manifest-tool https://github.com/estesp/manifest-tool/releases/download/v1.0.0/manifest-tool-linux-amd64
  chmod +x manifest-tool
fi

# create multi-arch manifest from template
cp multi-arch-manifest.yaml "multi-arch-manifest-${version}.yaml"
sed -i"" "s|__TAGS__|${tags}|g" "multi-arch-manifest-${version}.yaml"
./manifest-tool push from-spec "multi-arch-manifest-${version}.yaml"
