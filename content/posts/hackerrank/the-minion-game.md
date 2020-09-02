+++
title = "Hackerrank: The Minion Game"
date = "2020-09-01"
tags = ["python", "hackerrank"]
+++

## Problem

Kevin and Stuart want to play the 'The Minion Game'.

### Game Rules

Both players are given the same string, .
Both players have to make substrings using the letters of the string .
Stuart has to make words starting with consonants.
Kevin has to make words starting with vowels.
The game ends when both players have made all possible substrings.

### Scoring
A player gets +1 point for each occurrence of the substring in the string .

### For Example:
String  = BANANA
Kevin's vowel beginning word = ANA
Here, ANA occurs twice in BANANA. Hence, Kevin will get 2 Points.

Your task is to determine the winner of the game and their score.

### Solution

```
def minion_game(string):
    scores = {'Kevin': 0, 'Stuart': 0}
    for i in range(len(string)):
        if string[i] in 'AEIOU':
            scores['Kevin'] += len(string) - i
        else:
            scores['Stuart'] += len(string) - i
    
    if scores['Stuart'] == scores['Kevin']:
        print('Draw')
    elif scores['Stuart'] > scores['Kevin']:
        print("Stuart {}".format(scores['Stuart']))
    else:
        print('Kevin {}'.format(scores['Kevin']))
```