FROM alpine:latest
RUN apk add nginx curl vim
COPY nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /etc/nginx/conf.d/*
RUN mkdir /run/nginx
ENTRYPOINT nginx -g 'daemon off;'
