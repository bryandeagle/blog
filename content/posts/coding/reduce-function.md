+++
title = "Hackerrank Python: Reduce Function"
date = "2020-09-01"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

Given a list of rational numbers,find their product.

### Concept

The reduce() function applies a function of two arguments cumulatively on a list of objects in succession from left to right to reduce it to one value. Say you have a list, say [1,2,3] and you have to find its sum.

```python
>>> reduce(lambda x, y : x + y,[1,2,3])
6
```

You can also define an initial value. If it is specified, the function will assume initial value as the value given, and then reduce. It is equivalent to adding the initial value at the beginning of the list. For example:

```python
>>> reduce(lambda x, y : x + y, [1,2,3], -3)
3

>>> from fractions import gcd
>>> reduce(gcd, [2,4,8], 3)
1
```

## Solution

```python
from fractions import Fraction
from functools import reduce

def product(fracs):
    t = reduce(lambda x,y: Fraction(x.numerator*y.numerator,x.denominator*y.denominator) , fracs)
    return t.numerator, t.denominator

if __name__ == '__main__':
    fracs = []
    for _ in range(int(input())):
        fracs.append(Fraction(*map(int, input().split())))
    result = product(fracs)
    print(*result)
```
