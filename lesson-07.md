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

Vue.js Basics

---

# Preface

What is a javascript framework?

Starting from our `TODO List` project.

We **remove** all elements and **re-create** them when:

- **One** new todo is added
- **One** existing todo is removed
- (What we didnt do) one existing todo is updated

When we want to modify only **one** of them, we have to `re-render` everything.
Are there any technique support update **only one**** element? **Virtual DOM**.

---

# What is Virtual DOM?

- Use something other than a real DOM elements to represent data
- When a new todo object is added/removed/modified, it **changes the state**
- When the state is changed, the `re-render` process is triggered
- Before `re-render`, a virtual DOM library computes the difference of virtual DOM and decide what to update
- The `re-render` function **only updates** the neccessary part

---

# What is Virtual DOM?

<img src="https://i1.wp.com/programmingwithmosh.com/wp-content/uploads/2018/11/lnrn_0201.png?fit=1173%2C785&ssl=1" class="h-96">

---

# Vue.js

>What is [Vue.js](https://vuejs.org)? Here's the [introduction](https://v3.cn.vuejs.org/guide/introduction.html#vue-js-%E6%98%AF%E4%BB%80%E4%B9%88)

- Origin Author: [Even You](https://evenyou.me)
- Initial Released: Feb. 2014

Personal experience:
- A javascript framework with good Chinese documentation
- Easy to learn

