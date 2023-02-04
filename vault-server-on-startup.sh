#!/bin/bash

VAR_DATE=$(date)

echo -e "\n\n\n\n\n\n\n" &&
echo "The date is $VAR_DATE" &&

VAR_TARSAFE_DATE=$(echo "$VAR_DATE" | tr " " "_") &&

sleep 3 &&

tar --create --gzip --verbose --file "log-archive-$VAR_TARSAFE_DATE.tar.gz" /var/log &&

rm --recursive --force --verbose /var/log/* &&

sleep 3 &&

vault server -config=/home/administrator/config.hcl

exit 0


