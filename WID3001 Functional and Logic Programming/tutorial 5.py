# -*- coding: utf-8 -*-
"""
Created on Mon Mar 12 15:22:18 2018

@author: user
"""
#q1
def removeDup(inlist):
    return list(set(inlist))
print(removeDup('artificial'))

#q2
import string
def countType(instr):
    instr = [x for x in instr if x in string.ascii_lowercase]
    dicti = {'vowel':0,'consonant':0}
    for x in instr:
        if x in 'aeiou':
            dicti['vowel']+=1
        else:
            dicti['consonant']+=1
    return dicti
print(countType('artificial'))
def countType2(instr):
    temp = list(map(lambda x: 1 if x in 'aeiou' else 0,[x for x in instr.lower() if x in string.ascii_lowercase]))
    return {'vowel':temp.count(1), 'consonant':temp.count(0)}
print(countType2('artificial'))
    
#q3
def vowel(instr):
    return {x:instr.lower().count(x) for x in 'aeiou' if instr.lower().count(x)>0}
print(vowel('artificial'))

#q4
import math
def cylinder(radius):
    def volume(height):
        return math.pi * radius * radius * height
    return volume
cylin = cylinder(5)
cylin = cylin(10)
print(cylin)

#TUTORIAL
#q1
import string
def isPalindrome(instr):
    instr = ''.join(c for c in (''.join(c for c in instr if c not in string.punctuation).lower().split()))
    return instr[::-1]==instr
instr = ('A man, a plan, a canal: Panama')
print(isPalindrome(instr))

#q2
from functools import reduce
inlist = ['amore','roma','byebuii']

def sort(a,inlist):
    funcs = {'len': sorted(inlist,key=len), 'lchar': sorted(inlist,key=(lambda x:x[-1])), 'nvoweldesc': sorted(inlist,key=(lambda x: reduce(lambda x,y:x+y, [x.count(c) for c in 'aeiou'])),reverse=True)}
    return funcs[a] if a in funcs.keys() else 'error'
print(sort('len',inlist))

'''
def sortByLength(inlist):
    return sorted(inlist,key=len)
print(sortByLength(inlist))

def sortByLastCharacter(inlist):
    return sorted(inlist,key=(lambda x: x[-1]))
print(sortByLastCharacter(inlist))

def sortByNumberOfVowelDesc(inlist):
    return sorted(inlist,key=(lambda x: reduce(lambda x,y:x+y, [x.count(c) for c in 'aeiou'])),reverse=True)
print(sortByNumberOfVowelDesc(inlist))
'''

from functools import reduce
#q3
instr = "hello hello hello byebye lol"
dicti = {'countWord': lambda instr:{x:instr.count(x) for x in {x:0 for x in instr.split()}.keys()}}
print(dicti['countWord'](instr))

#q4
def factorial(n):
  return reduce(lambda x,y: x*y, range(1,n+1))
print(factorial(5))

#q5
def listtodict(x):
  return {x[0]: listtodict(x[1:]) if len(x) > 1 else {}}
listToDict = listtodict
print(listToDict(range(10)))