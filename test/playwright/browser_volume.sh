#!/bin/bash

set -e

source dev-container-features-test-lib

CACHE_DIR="/playwright/browsers"

check "playwright-browsers volume is mounted" test -d "$CACHE_DIR"

check "PLAYWRIGHT_BROWSERS_PATH is set" env | grep "PLAYWRIGHT_BROWSERS_PATH=$CACHE_DIR"
