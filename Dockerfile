
FROM alpine:latest

RUN apk add nginx

EXPOSE 80

RUN apk add --no-cache curl ca-certificates

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

STOPSIGNAL SIGQUIT
RUN mkdir -p /run/nginx /usr/share/nginx/html
COPY default.conf /etc/nginx/http.d/default.conf
COPY entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
