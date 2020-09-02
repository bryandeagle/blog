+++
title = "Hackerrank: Validating Matrix Script"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

Neo has a complex matrix script. The matrix script is a N X M grid of strings. It consists of alphanumeric characters, spaces and symbols (!,@,#,$,%,&).

To decode the script, Neo needs to read each column and select only the alphanumeric characters and connect them. Neo reads the column from top to bottom and starts reading from the leftmost column.

If there are symbols or spaces between two alphanumeric characters of the decoded script, then Neo replaces them with a single space ' ' for better readability.

Neo feels that there is no need to use 'if' conditions for decoding.

Alphanumeric characters consist of: [A-Z, a-z, and 0-9].

## Solution

```
#!/bin/python3

import math
import os
import random
import re
import sys

first_multiple_input = input().rstrip().split()
n = int(first_multiple_input[0])
m = int(first_multiple_input[1])
matrix = []

for _ in range(n):
    matrix_item = input()
    matrix.append(matrix_item)

s = ''  # Create string
for i in range(m):
    for r in matrix:
        s += r[i]

s = re.sub(r'(?<=[A-Za-z0-9])[!@#$%& ]+(?=[A-Za-z0-9])', ' ', s)

print(s)
```
