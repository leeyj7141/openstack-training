#!/bin/bash 
echo
echo "---- Run the command below at deploy server ----"
echo
echo "ssh <deploy server> "
echo ''
echo vim /etc/kolla/globals.yml
echo '##### change configuration "CHANGEME" ######'
echo
echo source /home/kolla-env/bin/activate 
echo kolla-ansible bootstrap-servers -i  /etc/kolla/multinode
echo kolla-ansible prechecks -i  /etc/kolla/multinode
echo kolla-ansible deploy -i  /etc/kolla/multinode
echo kolla-ansible post-deploy -i  /etc/kolla/multinode
