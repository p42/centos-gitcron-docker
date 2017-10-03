#!/usr/bin/with-contenv /bin/bash



if [ -d .git ]; then
    echo "Git repo exists in this directory"
    # git add . && \
    # git commit -m "Nightly Commit for $(date)"
else
    echo "No git directory in $(pwd)"
fi
