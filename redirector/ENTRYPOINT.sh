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
echo "Using the following vars:"
echo "dest: $dest"
echo "access_log $access_log"
echo "keep_uri $keep_uri"
echo "Adding custom settings"
if [ "$keep_uri" = "true" ]; then
	dest="$dest\\\$request_uri"
fi
exe sed -i "s/\!DEST/$dest/" /etc/nginx/conf.d/default.conf
exe sed -i "s/\!ACCESS_LOG/$access_log/" /etc/nginx/conf.d/default.conf
echo "Starting Webserver"
nginx -g 'daemon off;'
