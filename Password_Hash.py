#!/usr/bin/python

##Make Salt
from time import time
today = str(time())
##Ask for password
password = raw_input(“Please Enter Password: “)
import crypt; print crypt.crypt(password,today)
