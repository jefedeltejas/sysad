#!/usr/bin/env python   
#A System Information Gathering Script
import subprocess

#Command 1
def arp_func():

    arp = "arp"
    arp_arg = "-a"
   # stdout = " >> "
   # destination_file = "arpinfo.txt"
    print "Gathering ARP info from router with %s command:\n" % arp
    subprocess.call([arp, arp_arg])

#def cat_func():

#    cat = "cat"
#    cat_file = "arpinfo.txt"
#    subprocess.call([cat, cat_file])


def main():
    arp_func()
#    cat_func()

if __name__ == "__main__":
    main()

 
