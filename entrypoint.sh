#!/bin/sh
PAGE=/tmp/index.html
echo "<p><pre>" > $PAGE
curl https://ipinfo.io >> $PAGE
echo "</pre><p><pre>" >> $PAGE
printenv >> $PAGE
echo "</pre><p>" >> $PAGE
exec ./server
