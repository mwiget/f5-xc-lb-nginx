#!/bin/sh
PAGE=/tmp/index.html
cat <<EOF > $PAGE
<style type="text/css">
 <!--
 body {
  color: white;
  background-image: url(panorama.jpg);
  background-repeat: no-repeat;
  background-size: cover;
 }
 -->
</style>
<html>
<h1><p style="color:white;">f5-xc-lb-webserver</p></h1>
<a href="https://github.com/mwiget/f5-xc-lb-webserver">https://github.com/mwiget/f5-xc-lb-webserver</a>
<p><pre>
EOF
curl https://ipinfo.io >> $PAGE
printenv >> $PAGE
echo "</pre> <p> </body> </html>" >> $PAGE
exec ./server
