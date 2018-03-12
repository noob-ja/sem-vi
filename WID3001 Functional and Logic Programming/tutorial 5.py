# -*- coding: utf-8 -*-
"""
Created on Mon Mar 12 15:22:18 2018

@author: user
"""
def outer(a):
    return lambda x: a+x

output = outer(1)
print(output(3))