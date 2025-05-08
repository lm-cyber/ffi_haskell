from ctypes import *


lib = cdll.LoadLibrary("./libffi-example.so")

lib.checkStringHS.argtypes = [c_char_p]
lib.checkStringHS.restype = c_char_p

lib.example_init()

for x in range(4,8):
    print( lib.fibonacciHS(x))
    print( lib.factorialHS(x))
print('Test')

input_str = "Hello ADSADSA"
result = lib.checkStringHS(input_str.encode('utf-8'))
if result:
    print(result.decode('utf-8'))

lib.example_exit()
