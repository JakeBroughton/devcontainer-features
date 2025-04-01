#!/bin/bash

set -e

# Optional: Import test library
source dev-container-features-test-lib

ARCH=$(dpkg --print-architecture)

if [ "$ARCH" = "arm64" ]; then
  echo "Azure Functions Core Tools is not available for arm64. Skipping test."
  reportResults
  exit 0
fi

# Definition specific tests
check "version" func --version

# Report result
reportResults
