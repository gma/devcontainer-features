#!/bin/sh

set -e

echo "Installing dependencies for ${BROWSERS}"

su "${_REMOTE_USER}" -c "npm install -g playwright"
su "${_REMOTE_USER}" -c "npx playwright install-deps ${BROWSERS}"
su "${_REMOTE_USER}" -c "npm uninstall -g playwright"
