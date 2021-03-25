#!/bin/bash

cd "$(dirname "$0")"
cd ../lib/view
cp ../../configs/view.yaml configs/production.yaml
git pull
npm i
NODE_ENV=production node index.js