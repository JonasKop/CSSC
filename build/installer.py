#!/usr/bin/env python

from __future__ import print_function
from shutil import copyfile
import sys, subprocess, sys, os

argv = sys.argv

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)
def terror(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)
    exit(1)

FNULL = open(os.devnull, 'w')

if len(argv) != 2 or (argv[1] != "--install" and argv[1] != "--uninstall"):
    terror("Usage: installer --install OR --uninstall")

flag = argv[1]
dest = "/usr/local/bin/color"
src = "color"

if flag == "--install":
    if subprocess.call(["cp", src, dest]) == 0:
        print("Success: Installated the program to " + dest)
elif flag == "--uninstall":
    if subprocess.call(["rm", dest]) == 0:
        print("Success: Uninstalled the program")
