#!/bin/bash

set -eu

rm -rf .terraform*

script_dir=$(dirname "${BASH_SOURCE[0]}")
VERSION=$(cat "${script_dir}/VERSION") /bin/bash -c "$(curl -fsSL https://docs.runx.dev/install.sh)"

if [ -z "$TAG" ]; then
  ~/.opta/opta deploy --image $IMAGE --env $OPTA_ENV --config $CONFIG --auto-approve
else
  ~/.opta/opta deploy --image $IMAGE --env $OPTA_ENV --config $CONFIG --tag $TAG --auto-approve
fi
