#!/usr/bin/with-contenv /bin/bash

cd /var/www/html/wordpress/wp_content
git add .
git commit -m "Test Commit at $(date)"

# echo "Test Commit at $(date)"