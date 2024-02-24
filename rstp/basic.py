#!/usr/bin/python3

import socket
req = "DESCRIBE rtsp://77.137.22.254:554 RTSP/1.0\r\nCSeq: 2\r\nAuthorization: Basic YWRtaW46MTIzNA==\r\n\r\n"
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect(("77.137.22.254", 554))
s.sendall(req.encode())
data = s.recv(1024)
print(data)
