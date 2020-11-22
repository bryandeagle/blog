+++
title = "Hackerrank Python: Regex Substitution"
date = "2020-08-15"
tags = ["python", "hackerrank"]
categories = ["Coding"]
+++

## Problem

The re.sub() tool (sub stands for substitution) evaluates a pattern and, for each valid match, it calls a method (or lambda).
The method is called for all matches and can be used to modify strings in different ways.
The re.sub() method returns the modified string as an output.

Learn more about re.sub().

### Transformation of Strings

Code
```python
import re

#Squaring numbers
def square(match):
    number = int(match.group(0))
    return str(number**2)

print re.sub(r"\d+", square, "1 2 3 4 5 6 7 8 9")
```

Output
```python
1 4 9 16 25 36 49 64 81
```

### Replacements in Strings

Code
```python
import re

html = """
<head>
<title>HTML</title>
</head>
<object type="application/x-flash" 
  data="your-file.swf" 
  width="0" height="0">
  <!-- <param name="movie"  value="your-file.swf" /> -->
  <param name="quality" value="high"/>
</object>
"""

print re.sub("(<!--.*?-->)", "", html) #remove comment
```

Output
```python
<head>
<title>HTML</title>
</head>
<object type="application/x-flash" 
  data="your-file.swf" 
  width="0" height="0">

  <param name="quality" value="high"/>
</object>
```
### Task

You are given a text of N lines. The text contains && and || symbols.
Your task is to modify those symbols to the following:

```python
&& → and
|| → or
```

Both && and || should have a space " " on both sides.

## Solution

```python
import re
for _ in range(int(input())):
    s = re.sub(r'(?<=\s)\&\&(?=\s)', 'and', input())
    s = re.sub(r'(?<=\s)\|\|(?=\s)', 'or', s)
    print(s)
```
