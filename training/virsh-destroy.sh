#!/bin/bash 

vms=$1

virsh list --all |grep -i $vms |awk '{print $2}'  |xargs -n1 virsh destroy 
virsh list --all |grep -i $vms |awk '{print $2}'  |xargs -n1 virsh undefine --remove-all-storage
