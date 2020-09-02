+++
title = "Hackerrank Python: Merge the Tools!"
date = "2020-09-01"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

Consider the following:
- A string, s, of length n where s=c<sub>0</sub>c<sub>1</sub>...c<sub>n-1</sub>.
- An integer, k, where k is a factor of n.

We can split s into n/k subsegments where each subsegment, t<sub>i</sub>, consists of a contiguous block of k characters in s. Then, use each t<sub>i</sub> to create string u<sub>i</sub> such that:
- The characters in u<sub>i</sub> are a subsequence of the characters in t<sub>i</sub>.
- Any repeat occurrence of a character is removed from the string such that each character in u<sub>i</sub> occurs exactly once. In other words, if the character at some index j in t<sub>i</sub> occurs at a previous index <j in t<sub>i</sub>, then do not include the character in string u<sub>i</sub>.

Given s and k, print n/k lines where each line i denotes string u<sub>i</sub>.

## Solution

```python
def merge_the_tools(string, k):
    u, i = '', 1
    for c in string:
        if c not in u:
            u += c
        if i == k:
            i = 1
            print(u)
            u = ''
        else:
            i += 1
```
