#!/usr/bin/python

import sys
from pexpect import pxssh
import getpass
import os

user='root'
try:
  host = sys.argv[1]
except IndexError:
  print 'Must have host name or ip address'
  sys.exit(1)
password = 'yourpassword'
try:
  s = pxssh.pxssh()
  s.force_password = True
  s.login (host, user, password, login_timeout=20)

  pwd = os.getcwd()
  working_dir = pwd+'/../'
  cmd='cd '+ working_dir
  s.sendline (cmd)
  s.prompt()
 
  cmd='./03_run.sh DONT_WAIT'
  s.sendline (cmd)
  s.prompt()
  print s.before,s.after

# cmd='dmesg | tail -16'
# s.sendline (cmd)
# s.prompt()
# print s.before,s.after

#  s.interact()
except pxssh.ExceptionPxssh, e:
  print "pxssh failed on login."
  print str(e)
except OSError:
  print "End session to " + user + "@" + host

