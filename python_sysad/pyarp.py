#!/usr/bin/env python   
#A System Information Gathering Script
import subprocess

#Command 1
def arp_func():

    routing_table = "arp"
    arp_arg = "-a"
    print "Gathering ARP info from router with %s command:\n" % routing_table
    subprocess.call([routing_table, arp_arg])

#def cat_func():

#    cat = "cat"
#    cat_file = "arpinfo.txt"
#    subprocess.call([cat, cat_file])


def main():
    arp_func()
#    cat_func()

if __name__ == "__main__":
    main()

 
