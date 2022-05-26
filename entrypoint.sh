#!/bin/sh
PAGE=/usr/share/nginx/html/index.html
echo "<p><pre>" > $PAGE
curl https://ipinfo.io >> $PAGE
echo "</pre><p><pre>" >> $PAGE
printenv >> $PAGE
echo "</pre><p>" >> $PAGE
nginx -g "daemon off;"
