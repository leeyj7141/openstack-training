#!/bin/bash 

echo -e ""
read -p "###### Check the ansible inventory in ../createGuestVM/inventory/ ##
$( ls  ../createGuestVM/inventory/) 
####################################################################
###### Do you want to proceed? [y|n] ############################### " ANSWER
case $ANSWER in
  y)
    read -p "###### Choose your inventory ####################################### 
$(ls -1 ../createGuestVM/inventory/)
ansible inventory: " INVENTORY ;
    ansible-playbook -i ../createGuestVM/inventory/$INVENTORY  ../createGuestVM/virt-guest-multiple-nic.yaml ;
    ansible-playbook ansible/setup-inventory.yaml  -i ../createGuestVM/inventory/$INVENTORY ;;
  n)
    exit ;;
  *)
    exit ;;
esac
