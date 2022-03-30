#!/usr/bin/env sage3
# -*- coding: utf-8 -*-
from sage.all_cmdline import *

"""Defines a string of all possible characters to be converted"""
symbols = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=\n:;,.!?()@- "

"""Returns numeric representation of a string composed of convertible characters"""
def str2num(s):
	digits = [symbols.find(c) for c in s]
	return ZZ(digits,len(symbols))

"""Generates string out of number with characters from symbols"""
def num2str(n):
	s = ''.join([symbols[digit] for digit in n.digits(len(symbols))])
	return s

# angriff hab hier impl

p=10506009335447
n=10506009335446
alpha=2
beta=10285363316781
K.<alpha> = GF(p)
G = K.unit_group()
S_1 = [x for x in G if x.mod(3) == 0]
S_2 = [x for x in R if x.mod(3) == 1]
S_3 = [x for x in R if x.mod(3) == 2]

def func(s):
    if s in S_1:
        return alpha*s
    elif s in S_2:
        return beta*s
    else:
        return pow(s,2)

def pollard_rho(prim_num,generator,pk):
    K_1,K_2=1,1
    s,x,y=[],[],[]
    s[0],x[0],y[0]=1,0,0
    for i in srange(n):
        s[i]=func(K_1)
        K_1=s[i]
        s[2*i]=func(func(K_2))
        K_2=s[2*i]
        if s[i] in S_1:
            x[i] = (x[i-1]+1).mod(n)
            y[i] = y[i-1]
        elif s[i] in S_2:
            x[i] = x[i-1]
            y[i] = (y[i-1]+1).mod(n)
        elif s[i] in S_3:
            x[i] = (2*x[i-1]).mod(n)
            y[i] = (2*y[i-1]).mod(n)
        if s[2*i] in S_1:
            x[2*i] = (x[2*i-1]+1).mod(n)
            y[2*i] = y[2*i-1]
        elif s[2*i] in S_2:
            x[2*i] = x[2*i-1]
            y[2*i] = (y[2*i-1]+1).mod(n)
        elif s[2*i] in S_3:
            x[2*i] = (2*x[2*i-1]).mod(n)
            y[2*i] = (2*y[2*i-1]).mod(n)
        if K_1 == K_2:
            return ((x[2*i]-x[i])/(y[i]-y[2*i])).mod(n)

def main():
    z = pollard_rho(p,alpha,beta)
    print("z = dlog_alpha(beta) = {}".format(z))
    flg_fmt = num2str(z)
    print("FLAG: {}".format(flg_fmt))

if __name__ == "__main__":
    main()
