+++
title = "Hackerrank Python: Word Order"
date = "2020-08-23"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

You are given n words. Some words may repeat. For each word, output its number of occurrences. The output order should correspond with the input order of appearance of the word. See the sample input/output for clarification.

Note: Each input line ends with a "\n" character.

## Solution

```python
from collections import OrderedDict
d = OrderedDict()
for _ in range(int(input())):
    line = input()
    if line in d:
        d[line] += 1
    else:
        d[line] = 1
print(len(d))
print(' '.join([str(d[i]) for i in d.keys()]))
```
