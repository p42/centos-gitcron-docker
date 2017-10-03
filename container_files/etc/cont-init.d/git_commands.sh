#!/usr/bin/with-contenv /bin/bash

# Check if git is installed and if not, install it.
yum install git && \
cd /var/www/html/wordpress/wp-content &&\
git add . && \
git commit -m 'Nightly Commit at $(time)'
