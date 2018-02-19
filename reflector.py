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
   if pkt.haslayer(ARP) and pkt[ARP].pdst == args.victim_ip:
      arppkt = eval(pkt.command())
      arppkt[Ether].src = args.victim_ethernet
      arppkt[Ether].dst = pkt[Ether].src
      arppkt[ARP].psrc = args.victim_ip
      arppkt[ARP].hwsrc = args.victim_ethernet
      arppkt[ARP].pdst = pkt[ARP].psrc
      arppkt[ARP].hwdst = pkt[ARP].hwsrc
      arppkt[ARP].op = 2

      sendp(arppkt)
      arppkt.show2()
   elif pkt.haslayer(ARP) and pkt[ARP].pdst == args.reflector_ip:
      arppkt = eval(pkt.command())
      arppkt[Ether].src = args.reflector_ethernet
      arppkt[Ether].dst = pkt[Ether].src
      arppkt[ARP].psrc = args.reflector_ip
      arppkt[ARP].hwsrc = args.reflector_ethernet
      arppkt[ARP].pdst = pkt[ARP].psrc
      arppkt[ARP].hwdst = pkt[ARP].hwsrc
      arppkt[ARP].op = 2

      sendp(arppkt)
      arppkt.show2()

# IP layer
   if pkt.haslayer(IP) and pkt[IP].dst == args.victim_ip:
      ippkt = eval(pkt.command())
         # Handle TCP
      if pkt.haslayer(TCP) and pkt[IP].dst == args.victim_ip:
         del ippkt[TCP].chksum
      if pkt.haslayer(UDP) and pkt[IP].dst == args.victim_ip:
         del ippkt[UDP].chksum
      if pkt.haslayer(ICMP) and pkt[IP].dst == args.victim_ip:
         del ippkt[ICMP].chksum

# IP for Reflector
   if pkt.haslayer(IP) and pkt[IP].dst == args.reflector_ip:
      ippkt = eval(pkt.command())
         # Handle TCP
      if pkt.haslayer(TCP) and pkt[IP].dst == args.reflector_ip:
         del ippkt[TCP].chksum
      if pkt.haslayer(UDP) and pkt[IP].dst == args.reflector_ip:
         del ippkt[UDP].chksum
      if pkt.haslayer(ICMP) and pkt[IP].dst == args.reflector_ip:
         del ippkt[ICMP].chksum

# create packet and send
      ippkt[Ether].src = args.reflector_ethernet
      ippkt[Ether].dst = pkt[Ether].src
      ippkt[IP].src = args.reflector_ip
      ippkt[IP].dst = pkt[IP].src
      del ippkt[IP].chksum
      ippkt.show2()

      send(ippkt)
      


sniff(iface=args.interface, prn=reflect_pkt, store=0)


