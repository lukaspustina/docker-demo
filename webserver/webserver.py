#!/usr/bin/python
#######################################################
#
# Author: Lukas Pustina
#         (lukas.pustina [at] centerdevice.com)
#
#########################################################
#
# Requires
# - just python 2.6
#
########################################################
#
# Test
# - echo -e "GET /\n\n" | nc localhost 8080
########################################################

import logging
import sys
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer
import socket

MY_IP=socket.gethostbyname(socket.getfqdn())

class ServerHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        global MY_IP
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write("Hello %s, I am %s.\n" % (self.client_address[0], MY_IP))


class Server():

    def __init__(self, args):
        self.args = args

    def run( self ):
        logging.info("Started")
        try:
            server = HTTPServer(('', 8080), ServerHandler)
            server.serve_forever()
        except KeyboardInterrupt:
            logging.info( "CTRL-C received, shutting down server" )
            server.socket.close()
        logging.info("Shut down")


if __name__ == '__main__':
    FORMAT = "%(asctime)-15s %(message)s"
    LOGLEVEL = logging.INFO
    logging.basicConfig(level=LOGLEVEL, format=FORMAT)

    server = Server(sys.argv)
    server.run()


