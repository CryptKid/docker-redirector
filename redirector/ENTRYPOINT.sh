#!/bin/bash
exe() {
echo "Running \"$@\""
$@
}
echo "Installing template"
exe cp /redirector/redirects.conf /etc/nginx/conf.d/default.conf
echo "Escaping Vars"
dest="$(echo "$dest" | sed 's/\//\\\//g')"
access_log="$(echo "$access_log" | sed 's/\//\\\//g')"
echo "$dest"
echo "$access_log"
echo "Adding custom settings"
exe sed -i "s/\!DEST/$dest/" /etc/nginx/conf.d/default.conf
exe sed -i "s/\!ACCESS_LOG/$access_log/" /etc/nginx/conf.d/default.conf
echo "Starting Webserver"
nginx -g 'daemon off;'
