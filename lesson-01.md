---
# try also 'default' to start simple
theme: seriph 
# apply any windi css classes to the current slide
class: 'text-center'
# https://sli.dev/custom/highlighters.html
highlighter: shiki
# show line numbers in code blocks
lineNumbers: true
# some information about the slides, markdown enabled
info: |
  HTML and CSS basics
# persist drawings in exports and build
drawings:
  persist: true
background: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Introduction to web development

HTML and CSS Basics

---

# Say hello world to web

> Reference: https://nimo.network/post/get-started/

An easy webpage example:

```html
<!doctype html>
<html>
  <head>
    <title>Wow! Web!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>
  </body>
</html>
```

Create a file called `index.html** and paste the above codes into the file.

---

# What is a HTML file?

A webpage is actually an HTML file.

<style>
  .HTML-container {
    margin-top: 8rem;
    font-size: 2rem;
  }
  .HTML {
    font-size: 6rem;
    color: orange;
  }
  .spacer {
    width: 3rem;
    display: inline-block;
  }
</style>

<div class="HTML-container text-center">
  <span class="HTML">H</span><span>yper</span>
  <span class="HTML">T</span><span>ext</span> <span class="spacer"></span>
  <span class="HTML">M</span><span>arkup</span> <span class="spacer"></span>
  <span class="HTML">L</span><span>anguage</span>
</div>

<!-- The process of building a website will be introduced in the next lession -->

---
clicks: 6
---

# Look in details

How is a HTML file formed?

```html {all|1|2,9|3-5|6,8|7|all}
<!doctype html>
<html>
  <head>
    <title>Wow! Web!</title>
  </head>
  <body>
    <h1>Hello, world!</h1>
  </body>
</html>
```

<v-clicks at="1">

The first line declares the filetype.

</v-clicks>

<v-clicks at="2">

An HTML file is formed with tags and their children, recursively. The `html` tag is the root tag of an HTML file.

</v-clicks>

<v-clicks at="3">

The `head` tag defines the meta data of the webpage. The content of `head` tag are tags.

</v-clicks>

<v-clicks at="4">

The `body` tag specified the visible part of webpage.

</v-clicks>

<v-clicks at="5">

The content in `body` tag are tags or plain text.

</v-clicks>

---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# Tags

## Common tags in `head` tag

- title
- meta
  + description
  + viewport
- link
  + stylesheet
  + icon
  + scripts


---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# Tags 

## Common tags in `body` tag

- Headings: h1, h2, h3, h4, h5, h6
- Utilities: div, span, p, img, a, section
- Table related: table, thead, tbody, tr, td
- Layout related: header, footer, main, aside

<!-- examples -->

---
layout: section
---

# The webpage is so boring

---
layout: section
---

# Have a short break first! 

---

# Dedicate your website

CSS is what you need

<style>
  .CSS-container {
    margin-top: 8rem;
    font-size: 2rem;
  }
  .CSS {
    font-size: 6rem;
    color: orange;
  }
  .spacer {
    width: 3rem;
    display: inline-block;
  }
</style>

<div class="CSS-container text-center">
  <span class="CSS">C</span><span>ascading</span> <span class="spacer"></span>
  <span class="CSS">S</span><span>tyle</span> <span class="spacer"></span>
  <span class="CSS">S</span><span>heets</span>
</div>


---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# The structure of CSS is simple

```css
<selector> {
  <prop1> : <value1>;
  <prop2> : <value2>;
  ...
}
```

An example:

```css
h1 {
  color: red;
}
```

---

# But wait...Where to put my CSS code

- Inline

```html
<h1 style="font-size: 100px">I want to be larger</h1>
```

- Via `style` tag
```html
<!doctype html>
<html>
  <head>
    <title>Wow! Web!</title>
    <style>
      h1 {
        font-size: 100px;
      }
    </style>
  </head>
  <body>
    <h1>Hello, world!</h1>
  </body>
</html>
```

---
clicks: 2
---

# But wait...Where to put my CSS code

- Load external via `link` tag

<div grid="~ cols-2 gap-4">

<div>

> index.html

```html {all|5}
<!doctype html>
<html>
  <head>
    <title>Wow! Web!</title>
    <link ref="stylesheet" href="./style.css" type="text/css">
  </head>
  <body>
    <h1>Hello, world!</h1>
  </body>
</html>
```

</div>

<div>

> style.css

```css
h1 {
  font-size: 100px;
}
```

</div>
</div>

---

# Common properties

- Text related:
  + text-align
  + font-size
  + font-family
  + font-weight
  + color
  
- Utilities
  + width / max-width / min-width
  + height / max-height / min-height
  + display / visibility
  + background / background-color / background-image
  
--- 
  
# Common properties

- Layout related:
  + margin / margin-left / margin-right / margin-top / margin-bottom
  + padding
  + box-sizing
  
- shape:
  + border
    * border-radius
  + box-shadow
  
<!-- should be an example -->

---

# Exercise 01

Make a webpage displays the following content:

<div>
<iframe height="400" style="width: 100%;" scrolling="no" title="Nine-square" src="https://codepen.io/truco/embed/NWvbyRN?default-tab=html%2Cresult" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href="https://codepen.io/truco/pen/NWvbyRN">
  Nine-square</a> by Bill (<a href="https://codepen.io/truco">@truco</a>)
  on <a href="https://codepen.io">CodePen</a>.
</iframe>
</div>

---
layout: image-left
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# CSS selectors

- The selector we have learned: `tag-name`, `id`, `class`
- The combinations of selectors
  + div img
  + div > img
  + \*
  + div + img
  + h1 ~ a
- pseudo classes
  + a:hover
  + a:visited
  + ...

---

# Exercise 02

A CSS selector practice.

> https://flukeout.github.io/

<br>

<iframe height="320" style="width: 100%;" scrolling="no" title="CSS Diner" src="https://flukeout.github.io/" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true">
</iframe>

---

# Thanks for watching

<div grid="~ cols-2 gaps-4">

<div>

## Task

Make a **Self Introduction** page before the next lesson.

Requirements:

- Should be file(s) (Codepen is not suggested)
- The entry point is `index.html`

**Notice**: It is recommended to use fake info instead real world information since we will publish it to the Internet in the next lesson.

</div>

<div>

## Before you leave

Please fill this!

<img src='https://chart.googleapis.com/chart?cht=qr&chl=https%3A%2F%2Fwj.sjtu.edu.cn%2Fq%2FZBQDxDh9&chs=180x180&choe=UTF-8&chld=L|2' width="200" height="200">

</div>

</div>
