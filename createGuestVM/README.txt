download centos and rhel cloud image 
wget https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-1611.qcow2
rhel-guest-image-7.3-36.x86_64.qcow2

ansible-playbook -i hosts virt-guest-multiple-nic.yaml

edit vars directory files 

edit hosts inventory 
