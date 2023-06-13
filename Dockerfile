FROM ubuntu:22.04
RUN apt update && apt upgrade -y
RUN apt install -y wget tar nginx
RUN sed -i -e "s|root .*|root /dist/;|" /etc/nginx/sites-available/default
CMD wget $LINK_EXPLORER ; tar -xvf explorer.tar.gz && rm explorer.tar.gz ; service nginx start; sleep infinity