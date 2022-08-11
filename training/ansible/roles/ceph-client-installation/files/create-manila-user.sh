#!/bin/bash 

read -d '' MON_CAPS << EOF
allow r,
allow command "auth del",
allow command "auth caps",
allow command "auth get",
allow command "auth get-or-create"
EOF
   
ceph auth get-or-create client.manila -o /etc/ceph/ceph.client.manila.keyring \
mds 'allow *' \
mgr 'allow rw' \
osd 'allow rw' \
mon "$MON_CAPS"
