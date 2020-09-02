+++
title = "Hackerrank Python: ginortS"
date = "2020-09-01"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

You are given a string S.
S contains alphanumeric characters only.

Your task is to sort the string  in the following manner:
- All sorted lowercase letters are ahead of uppercase letters.
- All sorted uppercase letters are ahead of digits.
- All sorted odd digits are ahead of sorted even digits.

## Solution

```python
print(''.join(sorted(input(), key=lambda i:'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ 1357902468'.find(i))))
```
