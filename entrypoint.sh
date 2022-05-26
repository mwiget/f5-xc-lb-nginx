#!/bin/sh
PAGE=/usr/share/nginx/html/index.html
echo "<pre>" > $PAGE
curl https://ipinfo.io >> $PAGE
echo "</pre>" >> $PAGE
nginx -g "daemon off;"
