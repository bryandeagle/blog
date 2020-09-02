+++
title = "Hackerrank: Dealing with Complex Numbers"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

For this challenge, you are given two complex numbers, and you have to print the result of their addition, subtraction, multiplication, division and modulus operations.

The real and imaginary precision part should be correct up to two decimal places.

## Solution

```
import math

class Complex(object):
    def __init__(self, real, imaginary):
        self.n = complex(real, imaginary)
        self.real = real
        self.imaginary = imaginary

    def __add__(self, no):
        res = self.n + no.n
        return Complex(res.real, res.imag)

    def __sub__(self, no):
        res = self.n - no.n
        return Complex(res.real, res.imag)

    def __mul__(self, no):
        res = self.n * no.n
        return Complex(res.real, res.imag)

    def __truediv__(self, no):
        res = self.n / no.n
        return Complex(res.real, res.imag)

    def mod(self):
        res = math.sqrt(self.n.real ** 2 + self.n.imag ** 2)
        return Complex(res.real, res.imag)

    def __str__(self):
        if self.imaginary == 0:
            result = "%.2f+0.00i" % (self.real)
        elif self.real == 0:
            if self.imaginary >= 0:
                result = "0.00+%.2fi" % (self.imaginary)
            else:
                result = "0.00-%.2fi" % (abs(self.imaginary))
        elif self.imaginary > 0:
            result = "%.2f+%.2fi" % (self.real, self.imaginary)
        else:
            result = "%.2f-%.2fi" % (self.real, abs(self.imaginary))
        return result

if __name__ == '__main__':
    c = map(float, input().split())
    d = map(float, input().split())
    x = Complex(*c)
    y = Complex(*d)
    print(*map(str, [x+y, x-y, x*y, x/y, x.mod(), y.mod()]), sep='\n')
```
