# -*- coding: utf-8 -*-
"""
Created on Mon Mar 19 14:59:00 2018

@author: user
"""

#q1
def getSum(nest):
    if isinstance(nest,int):
        return nest
    elif len(nest)==0:
        return 0
    else:
        return getSum(nest[0]) + getSum(nest[1:])

nestedlist = [1,[2,3],[[4,[5]],6]]
print(getSum(nestedlist))

#q2
def multipleof3(val):
    if val>1:
        multipleof3(val-1)
    print(str(val)+'X3='+str(val*3))
multipleof3(10)

#q3
inputstr = "hello world"
def reverseStr(string):
    return string[-1] + reverseStr(string[:-1]) if len(string)>0 else ''
def reverseStr_kew(string):
    return reverseStr_kew(string[1:]) + string[0] if len(string)>0 else ''
print(reverseStr(inputstr))
print(reverseStr_kew(inputstr))

#q4
import string as strr
inputstr = 'A man, a plan, a canal: Panama'
def isPalindrome(string):
    string = ''.join(x for x in ''.join(x for x in string if x not in strr.punctuation).split()).lower()
    if len(string)<=1:
        return True
    else:
        return isPalindrome(string[1:-1]) if string[-1] == string[0] else False
def isPalindrome_kamwoh(string, l,r):
    if l==0:
        string = ''.join([c for c in string if c.isalpha()])
        r = len(string)-1
    if l<r:
        return string[l] == string[r] and isPalindrome_kamwoh(string,l+1,r-1)
    else:
        return True
print(isPalindrome(inputstr))

#q5
def flatten(nest):
    if isinstance(nest,int):
        return [nest]
    elif len(nest)==0:
        return []
    else:
        return flatten(nest[0]) + flatten(nest[1:])
def flatten_chiayi(nest):
    return [j for i in nest for j in i]
print(flatten(nestedlist))