FROM nginx
COPY entrypoint.sh /
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]
