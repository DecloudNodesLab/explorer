#!/bin/bash
yarn build-only
sleep 2
tar -czvf ./explorer.tar.gz dist/
sleep 2
git add .
sleep 2
git commit -m "Update"
sleep 2
