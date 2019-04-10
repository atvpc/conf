#!/bin/bash

# provides $USER, $PASS, and $IP
source /usr/local/bin/cctv-secrets.sh

for i in $(seq 1 8); do
	URI="rtsp://${USER}:${PASS}@${IP}:554/cam/realmonitor?channel=${i}&subtype=0"
	ffmpeg -loglevel panic -rtsp_transport tcp -y -i "$URI" -vframes 1 "/srv/htdocs/cctv/${i}.jpg";
	chown www-data:www-data -R /srv/htdocs/cctv
done
