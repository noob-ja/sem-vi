# -*- coding: utf-8 -*-
"""
Created on Mon Mar  5 15:20:23 2018

@author: user
"""

inputstring = input('String: ')

#Q1 determine if a word entered by a user is a palindrome.
if(list(inputstring)==list(reversed(inputstring))):
    print('Is a palindrome')
else:
    print('Not a palindrome')
    
#Q2 tokenize a large string
print(inputstring.split())

#Q3 define character(s) as being delimiters. 
import re;
print(re.split("ce",inputstring))

#Q4 takes a list words and returns the longest word with its length. 
def Q4(inputlist):
    result = [[len(n),n] for n in inputlist]
    result.sort();
    return result[-1]
from functools import reduce
def Q4b(inputlist):
    result = reduce(lambda a,b: a if len(a)>=len(b) else b, inputlist)
    return [len(result), result]
print(Q4(inputstring.split()))
print(Q4b(inputstring.split()))

#parsing vowels in a string
def parseVowel(string):
    return [c for c in string if c in ['a','e','i','o','u']]
print(parseVowel(inputstring))