---
theme: apple-basic
class: 'text-center'
lineNumbers: true
info: |
  Python Basics

layout: intro-image
image: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Introduction to Web Development

Python Basics

---
layout: image-right
image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/1024px-Python-logo-notext.svg.png'
---

# Hello Python

- Designed by: [Guido Van Rossum](https://gvanrossum.github.io/)
- First released: 20 Feb 1991
- Major Versions: Python 2.x, Python 3.x
- Latest Stable Version: Python 3.10
- Slower than C++, but shorter

## Installation

- **Windows:** Get [Installer](https://python.org/downloads/)
- **MacOS**: `brew install python3`
- **Ubuntu**: `sudo apt install python3`
- **Other**: Google/Bing

---

# Run Python Code

> Use Python Interpreter

Type `python` in your terminal. And you may see similar output as the following:

```python
Python 3.7.10 (default, Dec  5 2021, 00:36:37)
[GCC 9.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

### Use Python As a Calculator

```python
>>> 10 + 20
30
>>> 2 ** 32
4294967296
>>> 15 / 5
3.0
>>> 16 // 5
3
>>> 1 * 0
0
```

---

# Variables and Basic Types

Number

```python
>>> width = 10
>>> height = 20
>>> width * height
200
>>> area = width * height
>>> print(area)
200
```

---

# Variables and Basic Types

String

```python
>>> 'this is a string'
'this is a string'
>>> "ALSO A STRING"
'ALSO A STRING'
>>> 'escape \' with back slash'
"escape ' with back slash"
>>> s = 'hello \n world'
>>> s
'hello \n world'
>>> print(s)
hello
world
>>> """
... You can use multi-line string with three single/double quote
... """
'\nYou can use multi-line string with three single/double quote\n'
>>> print(r'hello\nworld')
hello\nworld
>>> print('hello\nworld')
hello
world
```

---

# Variables and Basic Types

String Functions

```python
>>> 'hello ' + 'world'
'hello world'
>>> '=' * 20
'===================='
>>> long_text = ('this is a long'
... 'string')
>>> print(long_text)
this is a longstring
>>> long_text[0]
't'
>>> long_text[-1]
'g'
```

---

# Variables and Basic Types

String Functions

```python
>>> word = 'Python'
>>> word[0:2]
'Py'
>>> word[2:5]
'tho'
>>> word[:2]
'Py'
>>> word[2:]
'thon'
>>> word[-2:]
'on'
>>> word
'Python'
>>> word[100]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: string index out of range
>>> word[:100]
'Python'
>>> word[100:]
''
```

---

# Useful functions

Get string length with `len`

```python
word = 'python3'
len(word)  # 7
```

Get user input with `input`

```python
user_input = input()
print(user_input)
```

**Exercises:** Design programs
- Get a string from user, concatenate its first and last letter to form a new string, print it out
- Get a string from user, concatenate its first 5 letters and last 5 letters, print it out

---

# Run Python Code

Copy your code to a new file. Suppose that the filename is `main.py`

Type the following command in your terminal:

```bash
python main.py
```

![](https://www.flynerd.pl/wp-content/uploads/2016/12/python_kurs.jpg)

---

# Variables and Basic Types

List

```python
>>> fib = [1, 1, 2, 3, 5, 8]
>>> fib   # or print(fib)
>>> fib[2]
2
>>> fib[-1]
8
>>> fib[-2:]
[5, 8]
>>> fib.append(13)  # try print(fib)
>>> fib_extend = [21, 34]
>>> fib + fib_extend
>>> fib = fib + fib_extend
```

```python
>>> l = [10]
>>> l.append('hello world')
>>> print(l)
[10, 'hello world']
>>> l = [[10, 20], [30, 40]]
>>> l[0]
[10, 20]
>>> l[0][0]
10
```

---

# Variables and Basic Types

Rarely used features

```python
>>> a = [1, 2, 3, 4]
>>> a[2:]
[3, 4]
>>> a[2:] = ['a', 'b', 'c']
>>> a
[1, 2, 'a', 'b', 'c']
>>> a[:]
[1, 2, 'a', 'b', 'c']
>>> a[:] = [0, 0, 0]
>>> print(a)
[0, 0, 0]
```

---

# Looooops

Use while loop to iterate a list

```python
>>> a, b = 0, 1  # a = 0, b = 1
>>> while a < 10:
...     print(a)
...     a, b = b, a+b
...
```

## Exercise

Encrypt a string with Caesar Cypher using `while` and `len`, write it on a `.py` file

---

# Control Flows

> Accroding to [PEP-8](https://www.python.org/dev/peps/pep-0008/), you are recommended to use 4 spaces instead of `tab`

### Example

```python
>>> group = input("Input a user group: ")
Input a user group: nimo
>>> if group == 'nimo':
...     print('WooooooW')
... elif group == 'nic':
...     print('Dalao/baixie')
... else:
...     print('你谁啊')
...
WooooooW
```

---

# Special `for` loop

> `for` loop in Python is a little bit different from C. `for` loop in Python is used to iterate objects.

```python
>>> string = 'DB? PIA!'
>>> for ch in string:
...     print(ch)
...
<More>
```

```python
>>> words = ['DB', 'pia', 'db', 'PIA']
>>> for w in words:
...     print(w)
...
<More>
```

### `for` loop with `range`

```python
>>> for i in range(10):
...     print(i)
...
```

---

# Usage of `range`

### Use `help` function

```python
>>> help(range)
Help on class range in module builtins:

class range(object)
|  range(stop) -> range object
|  range(start, stop[, step]) -> range object
```

### Example

```python
>>> for i in range(100):
...     pass  # 0 ~ 99
>>> for i in range(1, 101):
...     pass  # 1 ~ 100
>>> for i in range(1, 101, 2):
...     pass  # 1, 3, 5, 7, ..., 99
```

### Exercise

```python
Write a number guessing game
```

---

# Functions

A simple function

```python
>>> def hello():
...     print('Hi')
...     print('world')
...
>>> hello()
```

Add some args

```python
>>> def hello(name):
...     print('Hi ' + name)
>>> hello('Bill')
```

Default value
```python
>>> def login(username, password='password'):
...     return True if username == password else False
>>> login('nimo')              # False
>>> login('password')          # True 
>>> login('nimo', 'nimo')      # True 
>>> login('nimo', 'passss')    # False
```

---

# Exercises

- Finish the definition of `fib` function.

```python
def fib(n):
    """Generate first n numbers in Fibonacci series"""
    result = []
    # put your code here...
    return result
```

- The test script 
```python
def test(func=None):
    if func is None:
        func = fib
    assert func(0) == []
    assert func(3) == [0, 1, 2]
    assert func(10) == [0, 1, 2, 3, 5, 8, 13, 21, 34, 55]
    print('Congrates!')
```

---

# Keyword Argument

```python
def new_progress(who, what='user is sleeping', action='comment'):
    print(who + '\t' + action + '\t' + what)

# Correct
new_progress('NIC')
new_progress('NIC', 'the user is in Xuhui, you fanchele')
# =*=*=
new_progress('NIC', action='back_to_request')
new_progress('NIC', action='back_to_request', what='It is fixed')
new_progress('NIC', what='It is fixed', action='back_to_request')
new_progress(what='It is fixed', action='back_to_request', who='NIC')
```

```python
def new_progress(who, **kwargs):
    print(kwargs)
    action = 'comment'
    what = 'user is sleeping'
    if 'action' in kwargs:
        action = kwargs['action']
    if 'what' in kwargs:
        what = kwargs['action']
    print(who + '\t' + action + '\t' + what)
```

---

# Tuple 

- Tuple can be understand as **immutable** list.

```python
nats = (0, 1, 2, 3)
one_nat = (0, )
```

- How to know a variable's type

```python
zero_int = (0)
zero_tuple = (0, )
print(type(zero_int))
print(type(zero_tuple))
```

- Packing & Unpacking

```python
a = 1, 2, 3       # a = (1, 2, 3)
b = a, (4, 5, 6)  # b = ((1, 2, 3), (4, 5, 6))
c = a, 4, 5, 6    # c = ((1, 2, 3), 4, 5, 6)

one, two = 1, 2       # a = 1, b = 2
one, two, three = a
```

---

# Dict

- Create a dict

```python
a = { 'one': 1, 'two', 2 }
b = dict(one=1, two=2)

c = dict([('two', 2), ('one', 1)])
```

- Iteration

```python
# keys
d = dict(one=1, two=2, three=3)
for key in d:
    print(key)
# values
for val in d.values():
    print(val)
# key-val map
for key in d.keys():
    print(f'key = {key}, value = {d[key]}')
# Following feature is added in Python3.8
for key, val in d.items():
    print(f'{key=}, {val=}')
```

---
layout: intro-image
image: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Thanks for listening!

