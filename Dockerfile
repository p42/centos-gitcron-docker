#Install and configure [] 

FROM project42/s6-centos:centos7
MAINTAINER Brandon Cone bcone@esu10.org

COPY container_files /


# RUN git add . && \
# git commit -m 'Nightly Commit for $(date)'

# RUN yum install -y git

# RUN yum install -y git && \
# git add . && \
# git commit -m 'Nightly Commit for $(date)'