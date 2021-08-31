#!/usr/bin/python

# Open a file in write mode
fo = open("foo.txt", "rw+")
a=6
fo.write("%d\n"%a)
fo.write("%d\n"%a)
fo.close()