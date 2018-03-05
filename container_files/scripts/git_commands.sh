#!/usr/bin/with-contenv /bin/bash

echo "Directory received is ${1}"

if [ ! -d "$1" ]; then
    echo "The supplied directory does not exist"
    exit 0
fi

if [ ! -d ~/.ssh ]; then
    echo ".ssh directory does not exist. creating."
    mkdir ~/.ssh
    ls ~/.ssh
    echo "$KNOWN_HOSTS" > ~/.ssh/known_hosts
fi
if [ -e /run/secrets/id_rsa ]; then
    echo "Copying the private key, supplied via rancher secrets or other to ssh directory"
        # Force in git.ops.esu10.org into the known hosts file.
        # cat >> ~/.ssh/known_hosts <<EOF ${KNOWN_HOSTS}
    # mkdir ~/.ssh
    cp /run/secrets/id_rsa ~/.ssh/
    chmod 600 ~/.ssh/id_rsa
    ls -l ~/.ssh
else
    echo "No id_rsa file present. You should know that push and pull operations will likely fail"
fi

bash /scripts/git_install_setup.sh

cd $1

if [ -d .git ]; then
    echo "Git repo exists in this directory"
    git add . --all
    git commit -m "Nightly Commit for $(date)"
    PKG_OK=$(git remote -v|grep "fatal")
    if [ "" == "$PKG_OK" ]; then
        git push origin master
    fi
else
    echo "No git directory in $(pwd)"
    git init
    git config --global user.name "Docker Sidekick Container"
    git config --global user.email "bcone+docker_sidekick@esu10.org"
    if [ -n "$GIT_URL" ]; then
        echo "Remote url supplied, - ${GIT_URL} - adding origin."
        git remote add origin ${GIT_URL}
        git pull origin master
    fi
fi
