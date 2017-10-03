#!/usr/bin/with-contenv /bin/bash

# Check if git is installed and if not, install it.

PKG_OK=$(yum list installed git|grep "Installed Packages")
# echo Checking for somelib: $PKG_OK
if [ "" == "$PKG_OK" ]; then
  echo "Git not found. Installing"
  yum install -y git
  # sudo apt-get --force-yes --yes install the.package.name
else
    echo "git is installed and functioning"
fi
cd /var/www/html/wordpress/wp-content
git add .
git commit -m 'Nightly Commit at $(time)'
