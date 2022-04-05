---
theme: apple-basic
class: 'text-center'
lineNumbers: true
info: |
  Class in Python

layout: intro-image
image: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Introduction to Web Development

Python Basics - class and exceptions

---

# Class

Class is an abstraction of things. 
It is one of the key elements of Object-oriented programming (OOP).

## Class Definition in Python

```python
class Example:
  ...
```

## Class Objects - using class as an object

```python
class Example:
  """Example is an example class and shows simple class defnition in Python"""
  i = 100

  def f(self):
    return 100
```

You can use `Example.i` or `Example.f` to reference a property.

`__doc__` is also a valid attribute, try accessing `Example.__doc__` yourself.

---

# Class Object - instance of class

In python, you can create a instance by:

```python
example_object = Example()
example_object.i  # accessing the attribute
```

## Shared Data

Data variables in class defition are _shared data_.

Each instance of the class will have a copy of the _shared data_.

It works expectly most of the time, but sometime it doesn't.

```python
class A:
    items = []

a, b = A(), A()
a.items.append('hello')
print(b.items)
```

---

# The `__init__` method

The `__init__` method (if provided) is called an object is created.

It can be used to set attributes of an object.

```python
class Complex:
    def __init__(self, re, im):
        self.re = re
        self.im = im
```

Setting attributes of object outside `__init__` function is also allowed.

```python
c = Complex()
# set attribute that defined in __init__
c.re = 100
# set new attribute is allowed
c.new_attr = 'this is a new attribute'
```

---

# Calling Functions

A function can be called by `obj.func`.

```python
class Complex:
    def __init__(self, re, im):
        self.re = re
        self.im = im

    def show(self):
        print("Re:", self.re)
        print("Im:", self.im)

c = Complex(10, 5)

c.show()
```

The instance `c` is passed as the first argument of the function.

It is equivalent to:

```python
Complex.show(c)
```

---
clicks: 3
---

# Invoking other methods in method

Unlike `C++`, you cannot invoke `double` function by typing `double()`.

Instead, you should use `self.double()`

```python {all|14|all}
class Complex:
    def __init__(self, re, im):
        self.re = re
        self.im = im

    def show(self):
        print("Re:", self.re)
        print("Im:", self.im)

    def show_if_not_zero(self):
        if self.re == 0 and self.im == 0:
            print("It is zero!")
            return
        self.show()

c = Complex(10, 5)

c.show()
```
---

# Inherit

Inherit makes _class_ much more powerful.

```python
class DerivedClassName(BaseClassName):
    ...

class DerivedClassName(modname.BaseClassName):
    ...
```

Instantiation of derived class is the same as a normal class: `DerivedClassName()`.

Derived class can override methods defined in base class. For C++ programmers, all methods in Python are effectively `virtual`.

---

# Inheritance

```python
class Base:
    def __init__(self):
        self.what()

    def what(self):
        print("Hello from base")


class Derived(Base):
    def what(self):
        print("Hello from derived")

```

Now `Hello from derived` is printed when instantiation.

If you want to explicitly call the method defined in _Base_:

```python
d = Derived()
Base.what(d)
```

---

# Inheritance

A funny property: `__class__`, it shows the class name of an object

Built-in functions work with inheritance:

- `isinstance()` checks an instance's type: `isinstance(obj, int)` will be `True` if `obj.__class__` is `int` or some class derived from `int`
- `issubclass()` checks class inheritance: `issubclass(bool, int)` is `True` since `bool` is a subclass of `int`

## Multiple Inheritance

```python
class DerivedClassName(Base1, Base2, Base3): ...
```

When calling `DerivedClassName().method_name`, Python will search `method_name` accroding to Method Resolution Order(MRO).

In the example above, Base1 and its parents are searched before Base2 and Base3 (like `dfs`).

---

# Private Variables

Methods defined in derived class can be overrided by methods defined in base class. We can use private variables.

It is a convention to name private varibales with `_`. 
However, it is just a convention, the derived class can override this by defining variable with the same name.

Although Python does not support private variable, python will rename all variable prefixed with `__`  (double underscore) with `_className__varname`.

```python
class Mapping:
    def __init__(self, iterable):
        self.items_list = []
        self.__update(iterable)
    def update(self, iterable):
        ...
    __update = update   # private copy of original update() method

class MappingSubclass(Mapping):
    def update(self, keys, values):
        for item in zip(keys, values):
            self.items_list.append(item)
```

---

# Iterator - support `for` loop

`for` loop is equivalent to:
1. Get the generator with `iter()` function
2. Use `next()` function to get the next element for iterating
3. The `next()` function raise `StopIteration` exception, the `for` loop stops

We can implement `__iter__` and `__next__` function support this.

```python
class Reverse:
    """Iterator for looping over a sequence backwards."""
    def __init__(self, data):
        self.data = data
        self.index = len(data)
    def __iter__(self):
        return self
    def __next__(self):
        if self.index == 0:
            raise StopIteration
        self.index = self.index - 1
        return self.data[self.index]
```

---

# Generator

The example mentioned before may be too complex. To define a generator, we can use `yield` keyword.

```python
def reversedata):
    for index in range(len(data)-1, -1, -1):
        yield data[index]
```

Each time `next()` is called on it, the generator resumes where it left off. It remembers all the data values and which statement was last executed.

Its behavior is the same as `Reverse` class.

```python
>>> for char in reverse('golf'):
...     print(char)
...
f
l
o
g
```

The `StopIteration` will be automatically generated when there is no elements.

---

# Generator Expressions

Some simple generators can be coded succinctly as expressions using a syntax similar to list comprehensions but with parentheses instead of square brackets.

```python
sum(i ** 2 for i in range(10))

# dot product
a = [1, 2, 3]
b = [4, 5, 6]
sum(x * y for x, y in zip(a, b))
```

Actually it can be used for generating `list` and `dict`.

```python
one_to_ten = [i + 1 for i in range(10)]
```

---

# Exceptions

Python provides `try ... except ...` syntax for handling `Exceptions`.

```python
while True:
    try:
        x = int(input("Please enter a number: "))
        break
    except ValueError:
        print("0ops! This was no valid number. Try again...")
```

You can handle different `Exception` in different block.

```python
while True:
    try:
        x = int(input("Please enter a number: "))
        break
    except ValueError:
        print("0ops! This was no valid number. Try again...")
    except KeyboardInterrupt:
        pritn("OK...stopping")
        break
```

---

# Exceptions

Most of the exceptions are inheritted from `BaseException` class.

You can customize your own exception by creating a subclass of an existing exception class.

```python
class B(Exception): ...

class C(B): ...

class D(C): ...

for cls in [B, C, D]:
    try:
        raise cls()
    except D:
        print("D")
    except C:
        print("C")
    except B:
        print("B"))
```

- `raise` keyword is used to throw an exception.
- `except` works sequencially. `print("B")` will be executed three times if we put `except B` first.

---

# The full `try ... except` statement

An optional `else` statement can be used for statements that should execute after `try` block raised an exception.

```python
for arg in sys.argv[1:]:
    try:
        f = open(arg, 'r')
    except OSError:
        print('cannot open', arg)
    else:
        print(arg, 'has', len(f.readlines()), 'lines')
        f.close()
```

An optional `finally` statement can be used for statements that always executes.

---
layout: intro-image
image: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Thanks for listening!
