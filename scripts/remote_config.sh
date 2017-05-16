#!/bin/bash

set -eu

terraform remote config \
    -backend="atlas" \
    -backend-config="name=nathan-hashicorp/ghe-demo" \
    -backend-config="address=https://atlas.hashicorp.com"
