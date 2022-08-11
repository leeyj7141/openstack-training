#!/bin/bash 

ansible-playbook ansible/openstack-client-setup.yaml
echo
echo ---- Run the command below at deploy server ----
echo ''
echo "ssh <deploy server> "
echo ''
echo source /home/openstack-cli-env/bin/activate
echo source /etc/kolla/admin-openrc.sh 
echo openstack service list 
