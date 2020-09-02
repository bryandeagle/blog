+++
title = "Hackerrank: Maximize It!"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

You are given a function f(X) = X^2. You are also given K lists. The ith list consists of N_i elements.

You have to pick one element from each list so that the value from the equation below is maximized:

S = (f(X_1) + f(X_2) + ... + f(X_k)) % M

X_i denotes the element picked from the ith list. Find the maximized value S_max obtained.

% denotes the modulo operator.

Note that you need to take exactly one element from each list, not necessarily the largest element. You add the squares of the chosen elements and perform the modulo operation. The maximum value that you can obtain, will be the answer to the problem.

## Solution

```
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
