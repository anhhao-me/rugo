#!/bin/bash

cd "$(dirname "$0")"
cd ../lib/admin
cp ../../configs/admin.env .env
git pull
npm i
npm run serve