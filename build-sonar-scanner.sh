#!/bin/sh

set e

docker build -t jurabek/sonarscanner -f sonar-scanner.Dockerfile .
docker push jurabek/sonarscanner