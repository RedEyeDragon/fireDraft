#!/usr/bin/python3

import scapy.all
from scapy.all import *
import argparse

# Args
parser = argparse.ArgumentParser()
parser.add_argument('--interface')
parser.add_argument('--victim-ip', dest='victim_ip')
parser.add_argument('--victim-ethernet', dest='victim_ethernet')
parser.add_argument('--reflector-ip', dest='reflector_ip')
parser.add_argument('--reflector-ethernet', dest='reflector_ethernet')
args = parser.parse_args()
conf.iface = args.interface


# monitor the arp requests
def reflect_pkt (pkt):
   #pkt.show2()

# Check to see if has ARP layer
   if pkt.haslayer(ARP):

      if pkt[ARP].pdst == args.victim_ip:
         arppkt = eval(pkt.command())
         arppkt[Ether].src = args.victim_ethernet
         arppkt[Ether].dst = pkt[Ether].src
         arppkt[ARP].psrc = args.victim_ip
         arppkt[ARP].hwsrc = args.victim_ethernet
         arppkt[ARP].pdst = pkt[ARP].psrc
         arppkt[ARP].hwdst = pkt[ARP].hwsrc
         arppkt[ARP].op = 2

         sendp(arppkt)
         #arppkt.show2()


      elif pkt[ARP].pdst == args.reflector_ip:
         arppkt = eval(pkt.command())
         arppkt[Ether].src = args.reflector_ethernet
         arppkt[Ether].dst = pkt[Ether].src
         arppkt[ARP].psrc = args.reflector_ip
         arppkt[ARP].hwsrc = args.reflector_ethernet
         arppkt[ARP].pdst = pkt[ARP].psrc
         arppkt[ARP].hwdst = pkt[ARP].hwsrc
         arppkt[ARP].op = 2

         sendp(arppkt)
         print("ARP sent packet: ")
         #arppkt.show2()


# Handle IP and Ethernet layers
   else:
      ippkt = eval(pkt.command())

# IP check
      if pkt.haslayer(IP):

# Check if victim is destination
         if pkt[IP].dst == args.victim_ip:
            ippkt[Ether].src = args.reflector_ethernet
            ippkt[Ether].dst = pkt[Ether].src
            del ippkt[IP].chksum


# Check if reflector is destination
         elif pkt[IP].dst == args.reflector_ip:
            ippkt[Ether].src = args.victim_ethernet
            ippkt[Ether].dst = pkt[Ether].src
            del ippkt[IP].chksum


# Check if has Ethernet layer
      elif pkt.haslayer(TCP):

         if pkt[TCP].dst == args.victim_ethernet:
            ippkt[Ether].src = args.reflector_ethernet
            ippkt[Ether].dst = pkt[Ether].src
            del ippkt[Ether/TCP].chksum


         if pkt[TCP].dst == reflector_ethernet:
            ippkt[Ether].src = args.victim_ethernet
            ippkt[Ether].dst = pkt[Ether].src
            del ippkt[Ether/TCP].chksum


# Check if has UDP layer
      elif pkt.haslayer(UDP):

         if pkt[UDP].dst == args.victim_ethernet:
            ippkt[Ether].src = args.reflector_ethernet
            ippkt[Ether].dst = pkt[Ether].src
            del ippkt[Ether/UDP].chksum

         if pkt[UDP].dst == args.reflector_ethernet:
            ippkt[Ether].src = args.victim_ethernet
            ippkt[Ether].dst = pkt[Ether].src
            del ippkt[Ether/UDP].chksum


# create reflected packet and send back
            ippkt[IP].src = args.reflector_ip
            ippkt[IP].dst = pkt[IP].src
            ippkt.show2()

            print ("IP reply with new checksum")
            send(ippkt)

sniff(iface=args.interface, prn=reflect_pkt, store=0)


