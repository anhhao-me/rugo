#!/bin/bash

cd "$(dirname "$0")"
cd ../lib/api
cp ../../configs/api.yaml configs/production.yaml
git pull
npm i