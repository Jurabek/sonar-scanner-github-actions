#!/bin/sh

set -e

if [[ -z "${SONAR_TOKEN}" ]]; then
  echo "Set the SONAR_TOKEN env variable."
  exit 1
fi

if [[ -z "${SONARCLOUD_URL}" ]]; then
  SONARCLOUD_URL="https://sonarcloud.io"
fi

sonar-scanner -Dsonar.projectBaseDir=${INPUT_PROJECTBASEDIR} -Dsonar.host.url=${SONARCLOUD_URL}