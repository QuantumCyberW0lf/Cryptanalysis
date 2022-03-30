#!/usr/bin/env sage3
# -*- coding: utf-8 -*-
from sage import *
#from math import floor

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

p=10501442295156818901119336669847733404415910549203368912662563252902579724424245570758827899225502288168475973217225326775050618809552417368231198676904399
alpha=2
beta=10433096433947457087929147360991569669772028533143157390319697241380472965131636998273919761860553970963379771034833656492828008584900473740966404717412737
gamma=4855911559253796102707375539214406793655166992807052297635737602116559286225823168910389966432149373075668334791080662851933545684440452946406449123655531
delta=9339305547935864773752326716711483928288526979821274143229779394300331770449496913130343380232367412151733732616916789102208467034228546831815995050344640

# Den Angriff ab hier implementieren.
def attack():
    r_max = pow(2,32)-1
    #nr_list = range(r_max)
    L = 0
    R = r_max - 1

    while L <= R:
        r = floor((L+R)/2)
        if pow(alpha,r_max-r,p) < gamma:
            L = r + 1
        elif pow(alpha,r_max-r,p) > gamma:
            R = r - 1
        else:
            return r
    return -1 #If r is not found

def main():
    r = int(attack())
    m = mod((pow(beta,-r,p)*delta),p)
    print(num2str(m))
if __name__ == "__main__":
    main()
