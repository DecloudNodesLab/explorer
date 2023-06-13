#!/bin/bash
cat > /etc/nginx/sites-available/default <<EOF 
server {
listen 80;
listen [::]:80;
server_name _;
root /dist;
index index.html;
location / {
try_files $uri $uri/ =404;
}
}
EOF
