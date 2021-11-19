---
theme: seriph
class: 'text-center'
highlighter: shiki
lineNumbers: true
info: |
  The Javascript Language
background: 'https://source.unsplash.com/random/1080x720'
---

# Introduction to web development

The Javascript Language

---
layout: section
---

# The History

---

# The History

- Javascript was invented for `Netscape 2` in 1995
- Javascript aims to make web pages "live"
- `ECMAScript` is the standard of `Javascript`
- The programming language was named as `javascript` because java was very popular when the language was released
- Javascript is developing rapidly after 2000.
  + ES5, ES6, ES7... ES11 now
  + Promise, async/await, ...

<div grid="~ cols-3 gap-4" class="mt-4">

<div class="rounded shadow">
  <img src="https://miro.medium.com/max/1200/0*NAqwY1429cCNAGxo" alt="coffeescript">
</div>

<div class="rounded shadow flex items-center justify-center">
  <img class="h-24" src="https://i.pinimg.com/originals/c3/8e/e8/c38ee8475ee7f3680f706c56c3a1194c.png" alt="typescript">
</div>

<div class="rounded shadow flex items-center justify-center">
  <img class="h-24" src="https://ucarecdn.com/3310b79a-2119-4a99-b939-68f80128a2b8/" alt="typescript">
</div>

</div>

---

# Where to run javascript
> Javascript runs with javascript engine

## Browser

- A web page can directly put javascript code or tell browser to load a javascript file, the browser will run the javascript code when visiting the website
- As a developer, open `Inspector` (or press `F12` for most browser) and type javascript code in console to run it
- The code is running in a sandbox, which is "safe"

## Via Node.js

- Run a javascript file or run js code inside nodejs interpreter
- Can read, write files, visit websites... Doing almost everything you can do

---

# Load javascript in a web page

## Inside a `script` tag

```html
<script>
  alert('Run javacript here!')
</script>
```

<br />

## Put javascript in external file

<div grid="~ cols-2 gap-4">

<div>

#### The HTML file:

```html
<!-- load index.js -->
<script src="./index.js">
alert(1); // this will not be executed if `src` property is provided
</script>
<!-- load non-exist script won't stop the rendering process of browser -->
<script src="./non-exist.js"></script>
```

</div>

<div>

#### The script file

```javascript
alert('Hahahah!')
```

</div>

</div>

---
layout: section
---

# The Syntax

---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# Statement

```js
let x = 1000
/* You can use a new line 
   to show the statement is terminated */
let y = 2000; // or use a semicolons

alert(x
+ y)
/* or split a statement 
   to multi-line if neccesary */
var exp = 3 // read https://javascript.info/var for more info
```

<br>
<hr>
<br>

### Dynamic and Static Language
- The type of a variable can be changed when the program is running
- Property can be added to an object when the program is running
- An example is `Javascript`

---

# Variable

```js
let x = 100,
    y = 200
    
let $ = 'dollar',
    _ = 'underscore';
    
let 变量 = '变量'
const constant = 'constant'
```

<br>

## Why not `var`

Try this.

```js
console.log(var_let) // an error will be triggered
let var_let = 'let'

console.log(var_var) // undefined is logged
var var_var = 'var'
```



---
layout: image-left
image: https://source.unsplash.com/collection/94734566/1920x1080
---

## Data Type

- Number
- Boolean
- String
- null
- undefined
- Object
- Symbol

---

# Data Type

Number ranges from `2^53 - 1` to `-2^53`

```js
let n = 123 // number
n = 123.456 // number
n = 100 / 0 // number: Infinity
n = NaN     // number: NaN
n = 'hello' / 5 // number: NaN
```

<br>

## BigInt

```js
let n = 999n // BigInt: suffix with n
n = BigInt('0x1') // BigInt: construct from string
```

---

# Data Type
String, Boolean, null and undefined

```js
let str = "this is a string"
str = 'another string'

let template = `str is ${str}` // str is another string
template = `1 + 2 = ${2 + 1}`
```

```js
let b = true
b = false
b = Boolean(0)  // false
b = Boolean([]) // true
```

```js
let n = null
```

```js
// undefined is the init value of var
let u
console.log(u) // undefined
```

```js
typeof 10n // bigint
typeof true // boolean
```

---

# Interact with browser/user

```js
let answer = prompt('7 + 2 = ?') // pop up a prompt
let confirmed = confirm(`Is your answer ${answer}?`)
if (confirmed) {
  alert(`Your answer is ${answer}`)
} else {
  alert(confirmed)
}
```

<br>

## Exercise 01

- Ask user `1+2+3+4+...+50 = ?`
- Confirm user's choice
- If the user give the correct answer, show `Bingo!`
- If the user give a wrong answer, show `0ops!`

---

# Type Conversion

Explicit Conversion & Implicit Conversion

```js
/* explicit conversion */
let x = 1000
let str_x = String(x)
let bool_x = Boolean(x)
let bigint_x = BigInt(x)

let n = Number('100') // 100
let nan = Number('not a number') // NaN
let n_undefined = Number(undefined) // NaN
let n_null = Number(null) // 0

let b = Boolean(0) // false
let b_str_false = Boolean("") // false
let b_str_true = Boolean("dfda") // true
let b_arr = Boolean([]) // true
```

```js
/* implicit conversion */
console.log(1 + '1')
console.log('1' + 1)
console.log(1 == '1')
```

---

# Operators

Javascript's syntax is similar to C/C++

```js
// examples
let x = 100
let y = 200

if (x > y) {
  x = x ^ y;
  y = x ^ y;
  x = x ^ y;
}

x = 2 ** 10; // pow(2, 10)

// chain assignment
x = y = '100'

// the second one is the result
console.log((1, 2))

// for loop
let y = 0;
for (let x = 1; x <= 50; ++x) { y =+ x; }
```

---

# Operators

If we apply operator to different type..?

```js
console.log([] + 1)
console.log(1 + '0')

// checkout https://jsfuck.com for more info
console.log(![] + [])
console.log([! + []])
console.log([! + [] + ! + []])

// try this
console.log(0 == '0')
console.log(0 == [])
console.log('0' == [])
```

<br>

#### Strongly Typed vs Weakly Typed

- In a strongly typed language, a variable cannot automatically convert to another type.
- An example is `Python`

---

# Comparisons

```js
// number
console.log(1 > 2)
if (1 > 0) { console.log('always run') }
else { console.log('never run') }

if (1) { /* will cast 1 to boolean */ }

// string
console.log('apple' < 'banana')
// if ('apple' < 'google') { x = 'apple' } else { x = 'google' }
let x = ('apple' < 'google') ? 'apple' : 'google'
```

#### Always use strict comparison

```js
console.log(1 === '1')
console.log(undefined == null)
console.log(undefined === null)
```

#### Exercise
- Try `null > 0`, `null >= 0`, `null == 0`
- Compare `undefined` and `0`, explain the result


---
clicks: 5
---

# Operators

```js {all|1-7|9-12|14-22|all}
// suppose the boss and two employee are voting for a bill
// The result is generated by the following rules:
// 1. If the boss vote, the decision made by the boss will be the result
// 2. If the boss doesn't vote:
//    2.1 If both employee support, the result should be true
//    2.2 If none of the employee support, the result should be false
//    2.3 If only one of them supports, the result depends on you

// getVote(user) returns the user's vote (true or false), or return null if the user refuse to vote
let voteMaster = getVote('boss')
let vote1 = getVote('employee1')
let vote2 = getVote('employee2')

if (voteMaster !== null) {
  console.log(voteMaster)
} else if (vote1 === true && vote2 === true) {
  console.log(true)
} else if (vote1 === false && vote2 === false) {
  console.log(false)
} else {
  console.log(Math.random() < 0.5) // a random result
}

```

---
clicks: 3
---

# Operators

```js {all|14-22|all}
// suppose the boss and two employee are voting for a bill
// The result is generated by the following rules:
// 1. If the boss vote, the decision made by the boss will be the result
// 2. If the boss doesn't vote:
//    2.1 If both employee support, the result should be true
//    2.2 If none of the employee support, the result should be false
//    2.3 If only one of them supports, the result depends on you

// getVote(user) returns the user's vote (true or false), or return null if the user refuse to vote
let voteMaster = getVote('boss')
let vote1 = getVote('employee1')
let vote2 = getVote('employee2')

console.log(
  voteMaster ?? // return voteMaster if voteMaster is not null
  // or return the result after ?? if voteMaster is null
  (
    (vote1 === vote2) ?  // if em1 and em2 have the same vote (both true or both false)
    vote1 : // return one of their choice since their choices are the same
    (Math.random() < 0.5) // The `depends on you` part
  )
)
```

---

# Loops

Loops in javascript are similar to `C/C++`

```js
for (let i = 0; i < 50; ++i) {
  if (i === 10)  { continue }
  console.log(i)
}

let x = 0
while (x == 0) {
  break
}
```

## Exercise

Encrypt string `HiJavascript` using `Caesar Cipher` with key `3`.

The following is a description of `Caesar Cipher` from `Wikipedia`.

> It is a type of substitution cipher in which each letter in the plaintext is replaced by a letter some fixed number of positions down the alphabet. For example, with a left shift of 3, D would be replaced by A, E would become B, and so on. 

---

# Array

> Recommend reading: https://javascript.info/array

```js
let x = new Array()
let arr = [1, 2, 30, 10, 15]
let mixed = [1, '2', 3, null]

arr[1] // 2
mixed[3] // null
mixed[99999] // undefined

a.length // 5
```

<br>

### A better way for looping array

```js
let arr = ['hello', 'world']

for (let element of arr) { console.log(element) }

for (const element of arr) { console.log(element) }
```

---

# Functions

```js
let status = 'fine'
function howru() {
  let askBack = 'And you?'
  return `I'm ${status}, thank you. ` + askBack
}

function log(x, y) {
  console.log(x)
  console.log(y)
}

log(1) // 1, undefined
log(1, 2) // 1, 2
log(1, 2, 3) // 1, 2
```

<br>

### Exercise

Wrap your encryption process of `Caeser Cipher` to a function all encrypt

---

# Functions

```js
function add(x, y) { console.log(x, y) }

// with default value
function add(x, y = 0) { console.log(x, y) }

// the same as
let add = function (x, y = 0) { return x + y }

// arrow function
let log_arrow_1 = (x, y = 0) => { return x + y }
let log_arrow_2 = (x, y = 0) => x + y
```

<br>

### Try this

<div grid="~ cols-2 gap-4">

```js
sayHi()
function sayHi() { console.log('hi') }
```

```js
sayHi()
let sayHi = () => { console.log('hi') }
```

</div>

---

# Objects

> Recommend reading: https://javascript.info/object

```js
let obj = new Object()
let eobj = {}

let user = {
  age: 99999,
  name: 'Jiang',
  interview: function () {
    console.log('you are too young, too simple')
  },
  'hello': 'world'
}

user.age = user.age + 1
user.prop = 'newProp'
console.log(user)

delete user.prop
delete user['hello'] // same as delete user.hello
console.log(user)
```

---

# Objects

> Recommend reading: https://javascript.info/object

```js
let propName = prompt('The prop name')

let obj = {
  propName: 1 // gets { "propName": 1 }
  [propName]: 1 // √
}

let age = 99999
let obj1 = {
  age: age
}
let obj2 = {
  age
}
console.log(obj1.age === obj2.age)
```

---

# Objects

> Recommend reading: https://javascript.info/object

```js
let obj = {}
console.log(obj.nonexist) // undefined

obj = { 0: 1, 2: 3, hello: 'world' }
console.log(obj[0]) // equal to obj[String(0)]

console.log('hello' in obj) // true
console.log(0 in obj) // false
console.log('0' in obj) // true
```

## Loop over objects

```js
let obj = { x: 1, y: 2 }
for (const key in obj) {
  console.log(obj[key])
}
```

---
layout: section
---

# Interact with HTMLElement

---

# Get & Access an element

```js
let id_name = document.getElementById('name') // get #name
let class_name = document.getElementsByClass('name') // get .name

let x = document.querySelector('#name')
let y = document.querySelectorAll('.name')

let complex = document.querySelectorAll('.container .card > img')
```

```js
let app = document.querySelector('#app')

app.classList // get all class
app.innerText = 'hello' // text only
app.innerHTML = '<h1>hello</h1>' // allow html tag
app.style.background = '#000'
```

---

# Listen Click Event

3 ways to listen the click event

<div grid="~ cols-2 gap-4">

```html
<button id="button">Click me!</button>
```

```js
let btn = document.querySelector('#button') // the element we want to bind

btn.onclick = function (el) {
  // do something
}
```

</div>

<div grid="~ cols-2 gap-4">

```html
<button id="button">Click me!</button>
```

```js
let btn = document.querySelector('#button') // the element we want to bind

btn.addEventListen('click', () => {
  // do something
})
```

</div>

<div grid="~ cols-2 gap-4">

```html
<button id="button" onclick="do_something()">Click me!</button>
```

```js
function doSomething() {
  // do something
}
```

</div>

---

# Task

- Build a Calculator in Windows Design Style (Win 10 style is recommended)
- Only `+`, `-`, `*`, `/` function are required
- Only `0` to `9` are required as input (`(` and `)` are not required)
- Use `eval()` to calculate the expression
- **This is a two week project** 

