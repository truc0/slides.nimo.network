---
theme: seriph
class: 'text-center'
highlighter: shiki
lineNumbers: true
info: |
  How to build a real website
background: 'https://source.unsplash.com/random/1080x720'
---

# Introduction to web development

How to build a website?

---

# An overview

Building a website is not just coding

There are few customers provide a detailed UI design to you. 

They just simply tell you the function and a breif idea of the website.

Usually, a web frontend developer needs to handle some of the design job and giving tech support for hosting a website.

That's why we talked about `nginx` configuration before.

---

# An overview

The procedure

### Information Analysis
  - What's on the website
  - What's important, what's less important but neccesary, what's dispensable

### UI/UX Design
  - The important part should be easily found by users
  - The design should be intuitive

### Tech Stack Selection
  - A large project or a small one
  - The lib to be used and their compatibility

### Coding
  - The Structure of the project (function of each file)

---
layout: section
---

# The todo list project

---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# Information Analysis

What is important on the website?

- The title and deadline of a todo
- The level of a todo
- All todos, `EMERGENCY` level first
- A component for creating todos
- A component for marking a todo done quickly
- A summary of todos (the number of todos, etc.)

---

# UI/UX Design

<div grid="~ cols-2 gap-4">

<div>

### Principle

- Mobile First Design
- Responsive Design

### An example

- Click todo to edit
- There is a `√` at the right side of a todo, click to mark it done
- After click `+` button, a form will pop up for creating todo

</div>

<div class="flex items-center justify-center">

<img src="/lesson-04/design.png" class="h-64">

</div>

</div>

---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# Tech Stack

- Vanilla JS (means without a frontend framework)
- Base settings of `tailwindcss`
- `SCSS` for stylesheet
- `Vite` for developing and bundling

## More to note

- `localStorage` for persisting todos

---
layout: section
---

# Happy Coding

----

# Before start

Creating a project with vite

If you are using npm:

```bash
npm init vite@latest
# A project name will be requested during initialization
# Choose vanilla-js
cd <your-project-name>
npm install
npm install tailwindcss sass
npm run dev
```

Or if you are using yarn:

```bash
yarn create vite
# A project name will be requested during initialization
# Choose vanilla-js
cd <your-project-name>
yarn
yarn add tailwindcss sass
yarn dev
```

---

# 0x00 Construct a example block of todo

Edit stylesheet and index.html

> Related commit: https://github.com/truc0/todo-list/commit/183b995211a00dc444376d4b2155352021b3fdba

- Rename `style.css` to `style.scss`, change the corresponding `import` in `main.js`
- Add `@import 'tailwindcss/dist/base.min.css'` to the beginning of `style.scss`
- Use HTML and CSS coding for building your UI design, you can use fixed todo info

---

# 0x01 Load data

> Related commit: https://github.com/truc0/todo-list/commit/e2cfac73ca3ec7455980f0430a8a3c2b5afff8a2

<div grid="~ cols-2 gap-4">

```js
const todos = [
  {
    title: 'Math Homework',
    description: 'I dont know calculus',
    due: '',
    level: 'emergency',
    isDone: false
  },
  {
    title: 'English Homework',
    description: 'I dont speak English',
    due: '',
    level: 'emergency',
    isDone: false
  },
  {
    title: 'PE Homework',
    description: 'I stay at 127.0.0.1',
    due: '',
    level: 'emergency',
    isDone: false
  },
]
```

```js
const emergencyList = document.querySelector('#emergency-todo-list .todo-list')
while (emergencyList.childElementCount) {
  emergencyList.removeChild(emergencyList.firstChild)
}
for (const todo of todos.filter(t => t.level === 'emergency')) {
  const item = document.createElement('li')
  item.classList.add('todo-list-item')

  const itemTitle = document.createElement('h6')
  itemTitle.classList.add('todo-list-item-title')
  itemTitle.innerText = todo.title

  const itemDescription = document.createElement('p')
  itemDescription.classList.add('todo-list-item-description')
  itemDescription.innerText = todo.description

  item.appendChild(itemTitle)
  item.appendChild(itemDescription)

  emergencyList.appendChild(item)
}
```

</div>

---

# Creating Todo

Create a modal and support create function

<div grid="~ cols-2 gap-4">

```html
  <div id="modal" class="hidden">
    <div id="modal-content">
    </div>
  </div>

  <!-- put the following to style.scss -->
  <style>
    #modal {
        &.hidden { display: none; }
        width: 100vw; height: 100vh;
        background: rgba(0, 0, 0, .5);
        position: fixed; top: 0; left: 0;
        z-index: 99;
        display: flex; align-items: center; justify-content: center;
    }
    #modal-content {
        background: #ffffff;
        padding: 1rem; border-radius: .5rem;
        width: 88%; max-width: 480px;
    } 
  </style>
```

```js
const modal = document.querySelector('#modal')
const modalContent = document.querySelector('#modal-content')

const showModal = () => modal.classList.remove('hidden')
const hideModal = () => modal.classList.add('hidden')

modal.addEventListener('click', evt => {
    if (modalContent.contains(evt.target)) {
        // in content, not the mask
        // thus do nothing
        return
    }
    // or close the modal
    hideModal()
})
```

</div>

---

# Creating Todo

Create a modal and support create function

Related commits:

- https://github.com/truc0/todo-list/commit/ef3637a3f9b38320150f04271b6f48846d3b9c7e
- https://github.com/truc0/todo-list/commit/77f5c77b0cf67c32329553064ee4bf5f1abcd81e
- https://github.com/truc0/todo-list/commit/7deede3411972220e3ded293f23efd0cf9347bbc
- https://github.com/truc0/todo-list/commit/82f4f6acfd016789a96687c19887daea147bf824

**Note**: Put everything in one js file is bad, but the structure of the demo code is not good too...

It is suggested to put everything in a file first ( **only for this project** ), and refactor it after you finish the project

---

# Add `Mark Todo Done` Function

A tick on the right side of a todo element

Related commits:

- https://github.com/truc0/todo-list/commit/b31bd1ee1c9ce806527ba5b3330ee6982ae36abc
- https://github.com/truc0/todo-list/commit/0748bb43848ed5ab1908c60b4955b8ba452fde0a

---

# Editing Todo

Re-use the modal

Related commit:

- https://github.com/truc0/todo-list/commit/5d9b5fa7bca85844cb48d459a31dc11b940a0cfc

---

# Store todos in browser

Use `localStorage** to store todos

Related commit:

- https://github.com/truc0/todo-list/commit/a2eaa74a5c2b478a5e9c33338a2087444acd1d50

**Note**: the count is not included in this lesson since it is easy to implement

---

# Nearly done

Deploy your website

If you are using npm:

```bash
npm run build --base=<base>
```

Or you are using yarn:

```bash
yarn build --base=<base>
```

The files will be generated in `dist** directory

**The `--base` argument**: Suppose that you want to deploy your website on `https://yourdomian.nimo.network/hello/todo/`, you should set `--base` to `/hello/todo`. When you deploy the project on your website root directory, omit this argument or set it to `/`.
