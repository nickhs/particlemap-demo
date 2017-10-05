FROM alpine

RUN apk update
RUN apk add nginx

EXPOSE 80

RUN mkdir /run/nginx

COPY ./ops/nginx.conf /etc/nginx/nginx.conf

COPY ./particlemap/build/particlemap.min.js /var/www/particlemap/build/particlemap.min.js
COPY ./world.geo.json/ /var/www/world.geo.json/
COPY ./main.js /var/www/
COPY ./task.js /var/www/
COPY ./index.html /var/www/

CMD nginx
