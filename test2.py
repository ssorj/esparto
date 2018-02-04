import os
import sys

print(sys.path)
print(os.getcwd())
print(os.listdir())
print(os.listdir("/argon"))

print("---")

#import ustruct
#print(ustruct)

#x = bytes(bytearray(10))
#print(dir(x))

from argon.frames_debug import _main
_main()

#print(dir(argon))
#print(argon.__name__)
#print(argon.__path__)
