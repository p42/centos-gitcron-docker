#!/usr/bin/with-contenv /bin/bash

echo "Directory received is ${1}"

if [ ! -d "$1" ]; then
    echo "The supplied directory does not exist"
    exit 0
fi

bash /scripts/git_install_setup.sh

cd $1

if [ -d .git ]; then
    echo "Git repo exists in this directory"
    git add .
    git commit -m "Nightly Commit for $(date)"
else
    echo "No git directory in $(pwd)"
    git init
    git config --global user.name "Docker Sidekick Container"
    git config --global user.email "bcone+docker_sidekick@esu10.org"
fi
