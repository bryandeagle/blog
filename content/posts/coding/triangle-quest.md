+++
title = "Hackerrank Python: Triangle Quest"
date = "2020-09-01"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

You are given a positive integer N. Print a numerical triangle of height N-1 like the one below:

```python
1
22
333
4444
55555
......
```

Can you do it using only arithmetic operations, a single for loop and print statement?

Use no more than two lines. The first line (the for statement) is already written for you. You have to complete the print statement.

Note: Using anything related to strings will give a score of 0.

## Solution

```python
for i in range(1,int(input())):
    print(10**i//9*i)
```
