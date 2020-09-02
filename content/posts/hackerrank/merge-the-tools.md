+++
title = "Hackerrank: Merge the Tools!"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

Consider the following:
- A string, s, of length n where s=c0c1...cn-1.
- An integer, k, where k is a factor of n.

We can split s into n/k subsegments where each subsegment, ti, consists of a contiguous block of k characters in s. Then, use each ti to create string ui such that:
- The characters in ui are a subsequence of the characters in ti.
- Any repeat occurrence of a character is removed from the string such that each character in ui occurs exactly once. In other words, if the character at some index j in ti occurs at a previous index <j in ti, then do not include the character in string ui.

Given s and k, print n/k lines where each line i denotes string ui.

## Solution

```
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