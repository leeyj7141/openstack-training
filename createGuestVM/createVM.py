#!/bin/env python

import argparse
import subprocess
import sys

class CreateVM(object):
    @classmethod
    def get_args(cls):
        '''
        Parses arguments and return

        :return: 
        '''

        # Assign description to the help doc
        parser = argparse.ArgumentParser(
            formatter_class=argparse.RawDescriptionHelpFormatter,
            description='CreateVM executor parser')

        # Info
        parser.add_argument('-n', '--name', type=str, help='name of vm instance', required=True)
        parser.add_argument('-d', '--directory', type=str, help='directory path to save instance image file', required=True)
        parser.add_argument('-i', '--ip', type=str, help='IP address of instance', required=True)

        # Instance sizing
        parser.add_argument('-s', '--size', type=str, help='size', required=True)
        parser.add_argument('-c', '--cpu', type=str, help='number of CPU core', required=False)
        parser.add_argument('-m', '--memory', type=str, help='size of memory(in G)', required=False)

        # Array for all arguments passed to script
        args = parser.parse_args()

        return args

    @classmethod
    def run_subprocess(cls, cmd):
        try:
            proc = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            (out, err) = proc.communicate()

            if out:
                print out

            if err:
                print err

        except Exception as e:
            sys.stderr.writ("Error : RUN (%s)" % str(e))

        return out, err

    @classmethod
    def ping_check(cls, host):
        ping_ok, err = cls.run_subprocess("ping -c 1 " + host)

        if "errors" in ping_ok:
            return False
        elif "ttl=64" in ping_ok:
            return True

    @classmethod
    def create_vm(cls):
        playbook = '/home/createGuestVM/virt-guest.yaml'
        args = cls.get_args()

        if cls.ping_check(args.ip):
            sys.stderr.write("Failed : {host} is already used by another host!".format(args.ip))
        else:
            cmd = ['ansible-playbook ' + playbook +
                   ' --extra-vars "name=' + args.name +
                   ' network_ipaddr=' + args.ip +
                   ' image_file_path=' + args.directory +
                   ' disk_size=' + args.size +
                   '"']

            print(cmd)
            cls.run_subprocess(cmd)

if __name__ == '__main__':
    CreateVM.create_vm()
