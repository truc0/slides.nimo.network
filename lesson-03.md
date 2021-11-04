---
theme: seriph 
class: 'text-center'
highlighter: shiki
lineNumbers: true
info: |
  Javascript Basics & CSS Layout
background: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Introduction to web development

More CSS settings

---
layout: section
---

# CSS Layout

Flexbox & Layout

---

# CSS Layout 

## How developers layout their content?

- Using `table` tag. Take a look at `Campus` index page.
- Using `float` css property. **Hard** to layout multiple elements.

```css
.left { float: left; }
.right { float: right; }
```

## Any modern ways?

- CSS Flexbox : https://css-tricks.com/snippets/css/a-guide-to-flexbox/
- CSS Grid : https://css-tricks.com/snippets/css/complete-guide-grid/

```css
.flex { display: flex; }
.grid { display: grid; }
```

---

# CSS Flexbox

A one dimension layout method

## Basics

- `display` : set to `flex` or `inline-flex` to layout **children** elements with flexbox
- `flex-direction` : The main axis. Can be `row`, `row-reverse`, `column`, `column-reverse`
- `flex-wrap`: single line or multi-line. Can be `wrap`, `nowrap`. The default value is `nowrap`
- `flex-basis`: The length / width of Cross-Axis. The default value is `auto` (which means as long as possible)

---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# How to layout elements?

## CSS Property

- `align-items`
- `justify-content`

## CSS Value

- `space-between`
- `space-around`
- `space-evenly`
- `flex-start`
- `flex-end`
- `center`

---

# CSS Grid

Two-dimension layout

- `display`: Set to `grid` or `inline-grid` to enable CSS grid

## Draw a grid

- `grid-template-columns`
- `grid-template-rows`

### Examples

- `grid-template-rows: repeat(5, 1fr)`
- `grid-template-rows: 100px 200px 150px minmax(120px, 500px)`
- `grid-template-rows: minmax(200px, 1fr) minmax(200px, 1fr)`

---

# CSS Grid

Usage of grid-template-areas

<div grid="~ cols-2 gap-4">

<div>

```css
.container {
  display: grid;
  grid-template-columns: 50px 200px 50px;
  grid-template-rows: repeat(4, 100px);
  grid-areas: "s h h"
              "s m a"
              "s m ."
              "s f f";
}
```

</div>

<div>

```css
.header {
  grid-area: "h";
}
.main {
  grid-area: "m";
}
```

</div>

</div>

---
layout: section
---

# Responsive Web Design

---

# Responsive Web Design

- Mobile has become the most common device for browsing website
- Desktop is still important
- More and more people using tablet which is smaller than desktop and larger than mobile

## How to make a website that compatible with all devices, or fit all screen size?

- Make two websites
- Make our website **responsive**

---

# Media Query

Media queries are useful when you want to modify your site or app depending on a device's general type (such as print vs. screen) or specific characteristics and parameters (such as screen resolution or browser viewport width).

```css
@media (min-width: 300px) and (max-width: 800px) {
  p {
    color: cyan;
    font-size: 2rem;
  }
}

@media (min-width: 800px) {
  p {
    color: red;
    font-weight: bold;
    font-size: 4rem;
  }
}
```

---

# Mobile First Design

## Why

- 52.2% of global web traffic was via mobile phones

## The viewport tag

Add the following content to `head` tag in HTML.

```html
<meta name="viewport" content="width=device-width,initial-scale=1">
```

This tag tells mobile browser render the content in a larger size screen and display in the mobile screen by scaling them to screen size.

---
layout: section
---

# @keyframes in CSS

Animation with CSS

---

# A Quick Example

<div grid="~ cols-2 gap-4">

<div>

```css
.container {
  display: flex;
  justify-content: center;
  align-items: center;
}
.content {
  width: 100px;
  height: 100px;
  animation: 1s infinite alternate go;
}
```

</div>

<div>

```css
@keyframes go {
  0% {
    width: 100px;
    background: rebeccapurple;
  }
  100% {
    width: 400px; 
    background: aliceblue;
  }
}
```

</div>

</div>

---
layout: section
---

# Centralize Content

---
clicks: 5
---

# M.01 Old Fashion

<div grid="~ cols-2 gap-4">

<div>

```html
<div class="outer">
  <div class="inner">
  </div>
</div>
```

```css
* { box-sizing: border-box; }
body {
  margin: 0;
  padding: 0;
}

.outer {
  width: 100vw;
  height: 100vh;
}

.inner {
  width: 20vw;
  height: 20vh;
}
```

</div>

<div>

```css {all|2,7|8-9|10|all}
.outer {
  position: relative;
  border: 1px solid #000;
}

.inner {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
```

</div>

</div>

---

# M.02 Flexbox | Grid

<div grid="~ cols-2 gap-4">

<div>

```html
<div class="outer">
  <div class="inner">
  </div>
</div>
```

```css
* { box-sizing: border-box; }
body {
  margin: 0;
  padding: 0;
}

.outer {
  width: 100vw;
  height: 100vh;
}

.inner {
  width: 20vw;
  height: 20vh;
}
```

</div>

<div>

## Flexbox

```css {all|3-4|all}
.outer {
  display: flex;
  align-items: center;
  justify-content: center;
}
```

<br>

## Grid

```css
.outer {
  display: grid;
  grid-template: 1fr / 1fr;
}
.inner {
  justify-self: center;
  align-self: center;
}
```

</div>

</div>

---
layout: section
---

# CSS Pre-Processors

SCSS/SASS & Less & Stylus & ...

---

# SCSS/SASS

> Reference: https://sass-lang.com/guide

<div grid="~ cols-2 rows-2 gap-2">

<div>

## Variable

```scss
$font-stack: Helvetica, sans-serif;
$primary-color: #fff;

body {
  font: $font-stack;
  color: $primary-color;
}
```

</div>

<div>

## Nesting

```scss
ul {
  list-style: none;
  margin: 0;
  padding: 0;
  
  li {
    display: inline-block;
  }
}
```

</div>

<div>

## Mixins

```scss
@mixin theme($theme: DarkGreen) {
  background: $theme;
  box-shadow: 0 0 1px rgba($theme, .25);
}
.info { @include theme($theme: DarkGray); }
.alert { @include theme($theme: DarkRed); }
.success { @include theme; }
```

</div>

<div>

## Useful functions

```scss
@for $i from 1 through 3 {
  ul:nth-child(3n + #{$i}) {
    background: lighten(#036036, $i*5%);
  }
}
```

</div>

</div>

---

# SCSS/SASS

How to use?

Vite is a fast build tool for developing web projects. A dev server with HMR (Hot Module Replacement) and a build command to bundle everything are included.

## Install Vite

```bash
npx init vite@latest  # run this if you use npm
# yarn create vite    # run this if you use yarn
```

## Install SASS

```bash
npm install -D sass   # run this if you use npm
# yarn add -D sass    # run this if you use yarn
```

## Run DevServer

```bash
npm run dev           # run this if you use npm
# yarn dev            # run this if you use yarn
```

---

# SCSS/SASS

How to use?

- Modify `index.html` file as following:

```html
<head>
<!-- other tags -->
<style lang="scss">
  h1 { color: red; }
</style>
</head>
```

- Modify content in `style` tag to try `scss`

## Another way to try scss/sass is use Codepen

Change the CSS preprocessor settings to SCSS

---
layout: section
---

# CSS Framework

Bootstrap & Tailwind CSS & Bulma

---
layout: image-right
image: https://source.unsplash.com/collection/94734566/1920x1080
---

# CSS Framework

Each CSS framework have different design guideline. Most of them provide a basic grid system and useful components like:

- Button
- Card
- Form (Input)
- Dropdown
- ...

---

# Tailwind CSS

> Website: https://tailwindcss.com/

- Write CSS in class name:
  + h-32 / rounded / md:flex

## Pros
- Don't need CSS file anymore (x
- Better integration with Javscript
- (Personal Experience) Useful when using template language

## Cons
- The class name will be very long for complex feature
- Hard to reuse style

---

# Bootstrap

> Website: https://getbootstrap.com

- Used to be the most popular css framework
- With awesome prebuilt components
- Need Javascript


## Usage

<br>

```bash
npm i -D bootstrap @popperjs/core      # run this if you use npm
# yarn add -D bootstrap @popperjs/core # run this if you use yarn
```

Edit `main.js`, add following lines to the beginning
```js
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.min.css'
```

---

# Have a try with Bootstrap Card

<iframe height="400" style="width: 100%;" scrolling="no" title="Bootstrap Card Example" src="https://codepen.io/truco/embed/XWaZbPy?default-tab=result" frameborder="no" loading="lazy" allowtransparency="true" allowfullscreen="true">
  See the Pen <a href="https://codepen.io/truco/pen/XWaZbPy">
  Bootstrap Card Example</a> by Bill (<a href="https://codepen.io/truco">@truco</a>)
  on <a href="https://codepen.io">CodePen</a>.
</iframe>

---

# What's more?

## Classless CSS

- [Water.css](https://watercss.kognise.dev/)
- [MVP.css](https://andybrewer.github.io/mvp/)

## Other Popular Framework integrated with Javascript frameworks

- [Ant Design / Ant Design Pro](https://ant.design)
- [Chakra UI](https://chakra-ui.com)
- [Material Design](https://material.io)
- [Puppertino](https://github.com/codedgar/Puppertino) is a framework follows Apple's design guideline
- [Framework7](https://framework7.io) is a library for building apps acts like iOS, Android & Desktop

---

# Task

Build Windows 10 or Windows 11 desktop as a webpage. The requirements are:

## Taskbar

- The taskbar is **hidden** by default, and shows up when user hover it
- The taskbar can be place at the bottom, left, right or top as you like
- Icons should have special effect when user hover it
- Icons is not required to be the same
- Time should be included as content

## Other

- The background of desktop can be chosen as you like
- (Optional) Place some icons on desktop
- (Optional) There should be special effect when hover icons on desktop

---

# Task

## Other

- The time can be fixed
- Drag and drop function for icons is **NOT** required

## Demo

- https://mohamedelghandour.github.io/windows-10/
- https://codepen.io/MohamedElGhandour/full/GEbwEW (Source are the same)

---

# Some website you may need

## Icons

- https://www.flaticon.com
- https://fontawesome.com
- https://icons.getbootstrap.com
- https://fonts.google.com/icons?selected=Material+Icons

## CSS Framework

- https://getbootstrap.com
- (Please check slides before)
