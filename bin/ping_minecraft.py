#!/bin/python2

import socket
import struct
import json
import sys
import os

def unpack_varint(s):
    d = 0
    for i in range(5):
        b = ord(s.recv(1))
        d |= (b & 0x7F) << 7*i
        if not b & 0x80:
            break
    return d

def pack_varint(d):
    o = ""
    while True:
        b = d & 0x7F
        d >>= 7
        o += struct.pack("B", b | (0x80 if d > 0 else 0))
        if d == 0:
            break
    return o

def pack_data(d):
    return pack_varint(len(d)) + d

def pack_port(i):
    return struct.pack('>H', i)

def get_info(host='localhost', port=25565):

    # Connect
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.connect((host, port))

    # Send handshake + status request
    s.send(pack_data("\x00\x00" + pack_data(host.encode('utf8')) + pack_port(port) + "\x01"))
    s.send(pack_data("\x00"))

    # Read response
    unpack_varint(s)     # Packet length
    unpack_varint(s)     # Packet ID
    l = unpack_varint(s) # String length

    d = ""
    while len(d) < l:
        d += s.recv(1024)

    # Close our socket
    s.close()

    # Load json and return
    return json.loads(d.decode('utf8'))

if len(sys.argv) != 3:
  print "Usage: %s ip port" % sys.argv[0]
  exit(1)

info = get_info(sys.argv[1], int(sys.argv[2]))
players = info['players']

# blocket fun
if os.environ.get('BLOCK_BUTTON') == '4': # scroll up
  print ' '.join(map(lambda j: j['name'], players['sample']))
else:
  player_count = players['online']
  player_max = players['max']
  print "%s/%s" % (player_count, player_max)
