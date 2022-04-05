---
theme: seriph
class: 'text-center'
highlighter: shiki
lineNumbers: true
info: |
  Getting data from the Internet
background: 'https://source.unsplash.com/random/1080x720'
---

# Introduction to web development

Getting data from the Internet

---

# Preface

The missing part of our codes.

<div grid="~ cols-2 gap-4">

<div>

Consider the `vue` code.

The `posts` is a fixed array, which is useless in most of real world projects.

We have tried `localStorage` API to storage/get data in our browser.

But what if we want users access data *everywhere*?

</div>

```vue
<template>
<ul>
  <li v-for="post in posts">
  {{ post.title }}
  </li>
</ul>
</template>

<script>
export default {
  data() {
    return {
      posts: [
        { title: 'Post #1' },
        { title: 'Post #2' },
        { title: 'Post #3' },
      ]
    }
  }
}
</script>
```

</div>

---

# Data

Where is our data?

For a real-world blog, the data(posts) is not stored in frontend(the browser),
it is stored in server.

Precisely speaking, the data is stored in a **Database** in server.

## How to show posts to users?

To showing content of a post, a blog can:
- Generate a HTML file for each post, but it costs too much and hard to maintain
- Use a template, and generate full HTML file **ONLY** when user requests. A template looks like following (written in **Jinja**):

```jinja-html
<h1>{% post.title %}</h1>
<main>
{% post.content %}
</main>
```

---
layout: section
---

# How to do this with Frontend?

Getting data from server with Javscript

---
clicks: 4
---

# Reminder of HTTP Request

The basic transfer protocol in the Internet 

A HTTP **request** looks like this:

```markdown {all|1|2-8|all} 
GET /count.js HTTP/1.1
Host: realpython.disqus.com
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:95.0) Gecko/20100101 Firefox/95.0
Accept: */*
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Referer: https://realpython.com/
Connection: keep-alive
```

- `GET` specifies **HTTP method**
- `/count.js` specifies a **request target**
- `HTTP/1.1` specifies the procotol version

---

# Return Data instead of HTML file

Then we can show data in our webpace via `Javascript`.

Suppose there is an API for getting post info.

### The client (browser)

```markdown
GET /posts?id=1 HTTP/1.1
Host: api.nimo.network
...
```

### The server
```js
app.get('/posts', (request, response) => {
  const post = Posts[request.query.id]
  response.send(post) // in json format
})
```

---

# How to do?

Via `fetch` API or `axios` library

> Website: https://jsonplaceholder.typicode.com/

Following is an example that getting data from website above

```js
fetch('https://jsonplaceholder.typicode.com/todos/1')
  .then(response => response.json())
  .then(json => console.log(json))
```

The `fetch` function returns a **Promise**. 

A **Promise** can be thought as something representing a running task.

The `.then` function of a **Promise** receive a **function**, 
these functions will run after the task is finished.

And the result of the running task will be passed to the function as an argument.

---
clicks: 2
---

# Try it yourself

Create a button, show todos from `https://jsonplaceholder.typicode.com/todos/`

<v-click>

```vue
<template>
<div>
  <button @click="getData">Get Data</button>
  <ul>
    <li v-for="todo in todos">
  </ul>
</div>
</template>

<script>
export default {
  data() { return { todos: [] } },
  methods: {
    getData() {
      fetch('https://jsonplaceholder.typicode.com/todos')
        .then(response => response.json())
        .then(json => this.todos = json)
    }
  }
}
</script>
```

</v-click>

---

# Interact with Server

How to send message to server

From the previous example we know how to **get** data from server, but how do we **send** data to server?

Of course we can pass our data in _query string_ like `/register?username=nimo&password=nb`

But this is not cool because:

- The URL(Uniform Resource Locator) has limitation in length (depends on browser)
- It does not support file upload
- It is sometimes confuse when using `/todos?title=todoTitle` to _create_ todo

We can use `POST`, `PUT`, `PATCH` instead

---

# What's more

### The basic task for interacting with server

- **C**reate
- **R**ead
- **U**pdate
- **D**elete

Suppose we have a resource called `todo`, what we usually do is:

- Create a todo
- Read todos or read a specific todo
- Update a todo (title/description/...)
- Delete a todo 

---

# Some possible API Design

But some of them are terrible...

| Method | URL | Description |
| :----: | :-: | :--: |
| GET    | `/allTodos` | get all todos |
| GET    | `/todo`     | get all todos |
| GET    | `/todo?id=1` | get a todo that id equals 1 |
| POST   | `/createTodo` | create a todo |
| POST   | `/updateTodo` | update a todo |

---

# RESTful API 

REpresentational State Transfer API, a Better API Design Pattern

The RESTful style uses **HTTP method** and **URL** to determine what to do.

Suppose we have a resource called `todo`, the RESTful API looks like:

| Method | URL | Description |
| :----: | :-: | :--: |
| GET    | `/todos` | get all todos |
| GET    | `/todos?done=false`     | get undone todo |
| GET    | `/todos/100` | get a todo that id equals 100 |
| POST   | `/todos` | create a todo |
| PUT/PATCH | `/todos/100` | update Todo #100 |
| DELETE | `/todos/100` | delete Todo #100 |

---

# RESTful API

More about this style

Suppose we have another resource called `user`, each `user` can have many `todo`s.

The API looks like:

| Method | URL | Description |
| :----: | :-: | :--: |
| GET    | `/users` | get all users |
| GET    | `/users/100` | get a todo that id is 100 |
| GET    | `/users/100/todos` | get all todos that belongs to user #100 |
| GET    | `/users/100/todos/10` | (try to) get todo #10 that belongs to user #100 |

---
layout: image-right
image: https://source.unsplash.com/collection/94734566/960x1080
---

# RESTful API

Why this style?

## Pros
- Uniform Interface
- Self-descriptive

## Cons
- Hard to support complex scenario

---

# How to send message via other HTTP method?

Via `fetch` API

> https://developer.mozilla.org/en-US/docs/Web/API/Fetch\_API/Using\_Fetch

```js
function request(url, method='GET', data={}) {
  return fetch(url, {
    method: method,
    mode: 'cors',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data),
  })
}

request('https://jsonplaceholder.typicode.com/todos/')
  .then(response => response.json())
  .then(json => console.log(json))

request('https://nimo.network/request', 'POST', { guess: 123 })
  .then(response => response.json())
  .then(json => console.log(json))
```

---

# How to send message via other HTTP method?

Via `axios` library

> https://axios-http.com/docs

## Before using `Axios`

### Installation

```bash
npm install axios
```

Add the following lines to your `.vue` file if you are using `vite+vue`

```js
import axios
```

### Usage

```js
axios.post('/api', {
  guess: 123
}).then(response => console.log(response))
```

---

# A Guessing Game

> https://github.com/truc0/silly-guess/

<br>

## Run this program

1. Download/Clone the code from https://github.com/truc0/silly-guess/
2. `cd` to that directory
3. Run the following command:
```bash
npm install
```
4. Run the following command:
```bash
npm run start
```

5. Visit `https://localhost:8000` to see what happend

---

# API Description

## Create a new Game

1. Send a **POST** request to the server (`https://localhost:8000`).
2. Remember the **token** in response, it is the id of new created game
3. The new game is already generated, the answer is a integer between **0** (included) and **100** (excluded)

<br>

## Place a new guess 

1. Send a **POST** request to the server (`https://localhost:8000/<token>`), replace the `<token>` with your new game id
2. The response should shows guessing state (`too large`, `too small` or `bingo`)

<br>

## Get the status of a game

1. Send a **GET** request to (`https://localhost:8000/<token>`), replace the `<token>` with your new game id
2. The response should shows the state of the game (guess count, state)

---

# More to mention

1. This program is not fully **RESTful**
2. Take a look at `README.md` and `index.js` to know how this works

<img class="my-16" src="/lesson-08/form.png">

---
layout: cover 
background: 'https://source.unsplash.com/random/1080x720'
---

# Happy Coding

Have a good time with Frontend Development!
