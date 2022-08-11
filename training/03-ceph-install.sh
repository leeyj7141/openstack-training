#!/bin/bash 

echo ''
echo "---- Run the command below at deploy server ----"
echo
echo "ssh <deploy server> "
echo ''
echo vim ~/git/kms-ceph-ansible/group_vars/all.yml  
echo '##### change configuration "CHANGEME" ######'
echo
echo source /home/ceph-env/bin/activate 
echo 'cd ~/git/kms-ceph-ansible/'
echo ansible-playbook -i ansible-hosts  site-container.yml 
