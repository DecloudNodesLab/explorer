#!/bin/bash
yarn build-only
tar -czvf explorer.tar.gz dist/
git add .
git commit -m "Update"
(echo 310888)|git push
