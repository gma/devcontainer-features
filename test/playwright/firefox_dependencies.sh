#!/bin/bash

set -e

source dev-container-features-test-lib

check "npm is available" command -v npm


DEPENDENCIES=(
    libcairo2
    libxrender1
    fonts-freefont-ttf
)

check "browser dependencies are installed" dpkg --no-pager -l "${DEPENDENCIES[@]}"
