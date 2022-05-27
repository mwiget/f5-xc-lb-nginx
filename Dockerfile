FROM nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log \
    && chmod -R 777 /var/cache/nginx /var/run/ /usr/share/nginx/html/index.html

COPY default.conf /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
