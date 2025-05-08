from ctypes import *


lib = cdll.LoadLibrary("./libffi-example.so")

lib.example_init()

for x in range(10):
    print( lib.fibonacci_hs(x))

lib.example_exit()

