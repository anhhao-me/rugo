#!/bin/bash

cd "$(dirname "$0")"
cd ../lib/api
git pull
npm i