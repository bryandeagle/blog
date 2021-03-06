+++
title = "Hackerrank Python: Validating Credit Card Numbers"
date = "2020-08-21"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

You and Fredrick are good friends. Yesterday, Fredrick received  credit cards from ABCD Bank. He wants to verify whether his credit card numbers are valid or not. You happen to be great at regex so he is asking for your help!

A valid credit card from ABCD Bank has the following characteristics:

► It must start with a 4, 5 or 6.
► It must contain exactly 16 digits.
► It must only consist of digits (0-9).
► It may have digits in groups of 4, separated by one hyphen "-".
► It must NOT use any other separator like ' ' , '_', etc.
► It must NOT have 4 or more consecutive repeated digits.

### Examples:

Valid Credit Card Numbers
```python
4253625879615786
4424424424442444
5122-2368-7954-3214
```

Invalid Credit Card Numbers
```python
42536258796157867       #17 digits in card number → Invalid 
4424444424442444        #Consecutive digits are repeating 4 or more times → Invalid
5122-2368-7954 - 3214   #Separators other than '-' are used → Invalid
44244x4424442444        #Contains non digit characters → Invalid
0525362587961578        #Doesn't start with 4, 5 or 6 → Invalid
```

## Solution

```python
import re

for _ in range(int(input())):
    s = input()
    if not re.match(r'^[4-6]\d{3}-?\d{4}-?\d{4}-?\d{4}$', s):
        print('Invalid')
    else:
        if re.search(r'(\d)\1\1\1', re.sub(r'-', '', s)):
            print('Invalid')
        else:
            print('Valid')
```
