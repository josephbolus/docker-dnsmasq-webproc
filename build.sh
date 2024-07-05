#!/bin/bash

#docker buildx build --platform linux/amd64,linux/arm/v7,linux/arm64 -t marcovolpato00/dnsmasq-webproc:latest . --push
docker build -t nifc/dnsmasq:latest .