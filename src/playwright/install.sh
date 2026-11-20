#!/bin/sh

set -e

echo "## Installing dependencies for ${BROWSERS}"

npx --yes playwright install-deps ${BROWSERS}

mkdir -p /playwright/browsers
chown "${_REMOTE_USER}" /playwright/browsers
