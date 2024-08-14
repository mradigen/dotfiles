#! /bin/python3
n1 = str(bin(int(input('Enter number: '))))[2:]
n1 = '0' * (8-(len(n1) % 8)) + n1
print('Text inbetween the arrows ->' + ''.join([chr(int('0b' + x, 2)) for x in [n1[i:i+8] for i in range(0, len(n1), 8)]][::-1]) + '<-') # "If it works, don't touch it."
