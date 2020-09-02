+++
title = "Hackerrank: Validating Email Addresses with a Filter"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

You are given an integer N followed by N email addresses. Your task is to print a list containing only valid email addresses in lexicographical order.

Valid email addresses must follow these rules:
- It must have the username@websitename.extension format type.
- The username can only contain letters, digits, dashes and underscores.
- The website name can only have letters and digits.
- The maximum length of the extension is .

### Concept

A filter takes a function returning True or False and applies it to a sequence, returning a list of only those members of the sequence where the function returned True. A Lambda function can be used with filters.

Let's say you have to make a list of the squares of integers from 0 to 9 (both included).

```
>> l = list(range(10))
>> l = list(map(lambda x:x*x, l))
```

Now, you only require those elements that are greater than 10 but less than 80.

```
>> l = list(filter(lambda x: x > 10 and x < 80, l))
```

Easy, isn't it?

## Solution

```
import re

def fun(s):
    return re.match(r'^[A-Za-z0-9\-_]+@[A-Za-z0-9]+\.[A-Za-z]{1,3}$', s)
```
