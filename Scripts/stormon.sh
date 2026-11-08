#!/bin/bash

#sends an email with the currents storage usage
#you need to fill in your email, and change the target directory if needed.
{ echo "Subject: storage"; echo ""; df -h | grep -e "/dev/vda2" -e "Filesystem"; } | curl \
    --url "smtps://smtp.gmail.com:465" \
    --ssl-reqd \
    --mail-from "youremail@gmail.com" \
    --mail-rcpt "youremail@gmail.com" \
    --user "youremail@gmail.com:SMTPtoken" \
    --upload-file - \
    --silent \
    --show-error \
    --connect-timeout 30
