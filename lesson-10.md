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

Python Basics - modules and class

---

# A Quick Review

We have learned:

- Basic data types
- `while` loop and `for` loop
- `if` statement
- Function definition

**Ex 01** Write a function that satisfy :

- `func([1, 2, 3]) = 6`
- `func([10, 2000, 1, 0]) = 2011`
- `func([]) = 0`

---

# Arbitrary Arguments Lists

Try this.

```python
def concat(*args, sep='/'):
    print(args)
    return sep.join(args)

print(concat('home', 'users', 'nimo'))  
# ['home', 'users', 'nimo']
# 'home/users/nimo'
```

The argument `args` captures all params to the function call.

<hr>

**Ex 02** Write a function that satisfy:

- `func(1, 2, 3) = 6`
- `func(10, 2000, 1, 0) = 2011`
- `func() = 0`

---

# Modules

- Assuming we have two file, `other.py` and `main.py`.
- Put the function of **Ex 01** and **Ex 02** in `other.py`

```python
import other

print(other.func2(1, 2, 3))  # 6
```

Or we can use:

```python
from other import func1, func2

print(func1([1, 2, 3, 4]))  # 10
print(func2(1, 2, 3, 4))  # 10
```

If there are multiple functions in one module:

```python
from other import *

print(func1())  # 0
print(func2())  # 0
```

---

# Modules

- Importing a module will run the corresponding file

```python
# other.py
var_name = 'value'
print('Hello from other.py')

# main.py
import other
```

- You can import variables and functions from a module

```python
# other.py
var_name = 'value'

# main.py
from other import var_name
```

---

# Modules

Each module has a name.

```python
# other.py

# main.py
import other
print(other.__name__)
```

If we want some code **only** runs when we directly run `other.py`

```python
# other.py
if __name__ == '__main__':
    print('You are runing other.py')
else:
    print('You are importing other.py as a module')
```

Try:

<div grid="~ cols-2 gap-4">

```python
>>> # in python interpreter
>>> import other
```

```bash
# in shell
python other.py
```

</div>

---

# Modules

## Nested Module

```python
import os.path
print(os.path.abspath('.'))
```

## Alias Name

```python
from other import func2 as my_sum
my_sum(1, 2, 3)  # 6
```

## Some Insteresting Modules

Run the following code in python interpreter.

```python
>>> import sys
>>> sys.ps1
>>> sys.ps1 = '??>>'
```

And Try this.

```python
>>> import this
```

---
layout: intro-image
image: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Thanks for listening!
