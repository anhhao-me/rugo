FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y nginx git curl

RUN curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

WORKDIR /srv/www

RUN npm i -g pm2

RUN git clone https://github.com/anhhao-me/rugo-admin.git /srv/www/admin
COPY admin.env /srv/www/admin/.env
RUN cd /srv/www/admin && npm i && BASE_URL=/admin/ npm run build

RUN git clone https://github.com/anhhao-me/rugo-api.git /srv/www/api
RUN cd /srv/www/api && npm i
COPY ./api.yaml /srv/www/api/configs/production.yaml
COPY ./pm2.json /srv/www/ecosys.json

RUN mkdir /srv/www/storage

COPY ./nginx.conf /etc/nginx/sites-enabled/default
COPY ./start.sh /srv/www/start.sh

CMD ./start.sh