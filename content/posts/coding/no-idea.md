+++
title = "Hackerrank Python: No Idea!"
date = "2020-09-01"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

There is an array of n integers. There are also 2 disjoint sets, A and B, each containing m integers. You like all the integers in set A and dislike all the integers in set B. Your initial happiness is 0. For each i integer in the array, if i∈A, you add 1 to your happiness. If i∈B, you add -1 to your happiness. Otherwise, your happiness does not change. Output your final happiness at the end.

**Note:** Since A and B are sets, they have no repeated elements. However, the array might contain duplicate elements.

## Solution

```python
# Get the input values
_ = input()  # Don't care about 1st line
arr = list(map(int, input().split()))
a = set(map(int, input().split()))
b = set(map(int, input().split()))

score = 0
for n in arr:
    if n in a:
        score += 1
    elif n in b:
        score -=1
print(score)
```
