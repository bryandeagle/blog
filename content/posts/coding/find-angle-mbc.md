+++
title = "Hackerrank Python: Find Angle MBC"
date = "2020-09-01"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

ABC is a right triangle, 90° at B. Therefore, ∠ABC = 90°.

Point M is the midpoint of hypotenuse AC.

You are given the lengths AB and BC.

Your task is to find ∠MBC (angle θ°, as shown in the figure) in degrees.

## Solution

```python
import cmath
import math

i = int(input())
r = int(input())
a = complex(r, i)
print('{:.0f}°'.format(round(math.degrees(cmath.phase(a)),0)))
```
