+++
title = "Hackerrank Python: Maximize It!"
date = "2020-08-10"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

You are given a function f(X) = X<sup>2</sup>. You are also given K lists. The ith list consists of N<sub>i</sub> elements.

You have to pick one element from each list so that the value from the equation below is maximized:

S = (f(X<sub>1</sub>) + f(X<sub>2</sub>) + ... + f(X<sub>k</sub>)) % M

X<sub>i</sub> denotes the element picked from the ith list. Find the maximized value S<sub>max</sub> obtained.

% denotes the modulo operator.

Note that you need to take exactly one element from each list, not necessarily the largest element. You add the squares of the chosen elements and perform the modulo operation. The maximum value that you can obtain, will be the answer to the problem.

## Solution

```python
import itertools

(K, N) = map(int, input().strip().split())

L = list()
for i in range(K):
    L.append(list(map(int, input().strip().split(' ')))[1:])

S_max, L_max = 0, None
for l in itertools.product(*L):
    s = sum([x**2 for x in l]) % N

    if s > S_max:
        S_max = s
        L_max = l

print(S_max)
```
