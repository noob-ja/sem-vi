# -*- coding: utf-8 -*-
"""
Created on Mon Feb 26 15:10:21 2018

@author: user
"""

"""
Question 1
"""
matrix = [[1 if i==j else 0 for j in range(3)] for i in range(3)]
print(matrix)

"""
Question 2
"""
string = 'the wind blows the cradle will rock'.split()

list_com = [x.upper() for x in string]
print(list_com)

lambda_func = list(map(lambda x: x.upper(), string))
print(lambda_func)

"""
Question 3
"""
array = [[1,2],[3,4],[5,6],[7,8]]
out = [[array[i][j] for i in range(len(array))] for j in range(len(array[0]))]
print(out)