#!/bin/bash

set -eu

(cd terraform && \
terraform init && \
terraform push -name="nathan-hashicorp/ghe-tf-demo" -atlas-address="https://atlas.hashicorp.com")
