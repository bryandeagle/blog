+++
title = "Hackerrank: Piling Up!"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

There is a horizontal row of n cubes. The length of each cube is given. You need to create a new vertical pile of cubes. The new pile should follow these directions: if cube_i is on top of cube_j then sideLength_j ≥ sideLength_i.

When stacking the cubes, you can only pick up either the leftmost or the rightmost cube each time. Print "Yes" if it is possible to stack the cubes. Otherwise, print "No". Do not print the quotation marks.

## Solution

```
from collections import deque

for _ in range(int(input())):
    _ = input()
    h = deque(map(int, input().split()))
    
    res, v = '', 2**31
    l, r = h.popleft(), h.pop()
    while res == '':
        # print('v={},l={},r={},h={}'.format(v,l,r,list(h)))
        if l >= r and l <= v:
            v = l
            if len(h) == 0:
                res = 'Yes'
                break
            l = h.popleft()
        elif r > l and r <= v:
            v = r
            if len(h) == 0:
                res = 'Yes'
                break
            r = h.pop()
        else:
            res = 'No'
    print(res)
```
