+++
title = "Hackerrank Python: Compress the String!"
date = "2020-08-03"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

In this task, we would like for you to appreciate the usefulness of the groupby() function of itertools . To read more about this function, Check this out .

You are given a string S. Suppose a character 'c' occurs consecutively X times in the string. Replace these consecutive occurrences of the character 'c' with (X, c) in the string.

For a better understanding of the problem, check the explanation.

## Solution

```python
from itertools import groupby

print(' '.join(['({}, {})'.format(len(list(g)), k) for k,g in groupby(input())]))
```
