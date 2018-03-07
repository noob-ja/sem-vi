# -*- coding: utf-8 -*-
"""
Created on Mon Mar  5 16:24:09 2018

@author: user
"""

#Q1
inStr = "ASCII stands for American Standard Code for Information Interchange. Computers can only understand numbers, so an ASCII code is the numerical representation of a character such as 'a' or '@' or an action of some sort. ASCII was developed a long time ago and now the non-printing characters are rarely used for their original purpose. Below is the ASCII character table and this includes descriptions of the first 32 non-printing characters. ASCII was actually designed for use with teletypes and so the descriptions are somewhat obscure. If someone says they want your CV however in ASCII format, all this means is they want 'plain' text with no formatting such as tabs, bold or underscoring - the raw format that any computer can understand. This is usually so they can easily import the file into their own applications without issues. Notepad.exe creates ASCII text, or in MS Word you can save a file as 'text only'"
def countChar(string):
    alphabets = {string.lower()[x]:0 for x in range(len(string))}
    return {c:string.lower().count(c) for c in alphabets.keys()}
print(countChar(inStr))
def countChar2(string):
    return {x:string.lower().count(x) for x in [chr(x) for x in range(ord('a'),ord('z')+1)] if string.lower().count(x)>0}

def countChar3(string):
    return {string.lower()[x]:string.lower().count(string[x]) for x in range(len(string))}

#print(countChar3(inStr))

#Q2
def removePunct(string):
    punct = ['!','?',',','.']
    for p in punct:
        string = string.replace(p,'')
    return string
#print(removePunct(inStr))