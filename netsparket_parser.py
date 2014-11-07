#!/usr/bin/python
import re, os, hashlib, sys, getopt, argparse
#######################################
__author__ = "Eric J. Walker"
__license__ = "GPL"
__version__ = "0.1"
__maintainer__ = "Eric J. Walker"
__email__ = "ericjonwalker@gmail.com"
__status__ = "Development"
######################################
def usage():
   print(" ")
   print(" Netsparker XML File Parser to get Titles and Hash Values")
   print(" USAGE:" +  sys.argv[0] + " inputfile.xml")
   print(" ")
   sys.exit()

if len(sys.argv) != 2:
    usage()
if sys.argv[1] == '-h':
    usage()
else:
    inputfile  = sys.argv[1]

def main(argv):
    ##Read the file
    file = open(inputfile, "r")
    for line in file:
      match = re.search('<type>', line)
      if match:
        #print line
        tmp = re.sub('^.*<type>','',re.sub('</type>$','',line.rstrip()))
        #print tmp data
        print tmp.rstrip() + " - " + str(hashlib.md5(tmp).hexdigest())

if __name__ == "__main__":
    main(sys.argv[2:])
