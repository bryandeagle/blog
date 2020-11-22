+++
title = "Hackerrank Python: Athlete Sort"
date = "2020-08-01"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

You are given a spreadsheet that contains a list of N athletes and their details (such as age, height, weight and so on). You are required to sort the data based on the Kth attribute and print the final resulting table. Follow the example given below for better understanding.

Note that K is indexed from 0 to M-1, where M is the number of attributes.

**Note:** If two attributes are the same for different rows, for example, if two atheletes are of the same age, print the row that appeared first in the input.

## Solution

```python
n,m = map(int, input().split())
data = []
for _ in range(n):
    data.append(list(map(int, input().split())))
k = int(input())

data.sort(key=lambda x:x[k])

for l in data:
    print(' '.join([str(i) for i in l]))
```
