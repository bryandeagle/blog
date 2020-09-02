+++
title = "Hackerrank: Iterables and Iterators"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

The itertools module standardizes a core set of fast, memory efficient tools that are useful by themselves or in combination. Together, they form an iterator algebra making it possible to construct specialized tools succinctly and efficiently in pure Python.

To read more about the functions in this module, check out their documentation here.

You are given a list of N lowercase English letters. For a given integer K, you can select any K indices (assume 1-based indexing) with a uniform probability from the list.

Find the probability that at least one of the K indices selected will contain the letter: 'a'.

## Solution

```
from itertools import permutations

n = int(input())
s = input().replace(' ', '')
k = int(input())
p = [''.join(x) for x in permutations(s, k)]

num = 0
for x in p:
    if 'a' in x:
        num += 1

print(num/len(p))
```