---
theme: apple-basic
class: 'text-center'
lineNumbers: true
info: |
  Django Basics & Vuex/Vue Router Usage

layout: intro-image
image: 'https://source.unsplash.com/collection/94734566/1920x1080'
---

# Introduction to Web Development

Forms and Views in Django & Vuex

---

# Usage of `name` params in URLConf

- [reverse()](https://docs.djangoproject.com/en/4.0/ref/urlresolvers/#reverse)
- [url](https://docs.djangoproject.com/en/4.0/ref/templates/builtins/#url) template tag

## Example usage

Suppose we have `urls.py` as following.

```python
urlpatterns = [
  path('notes/<int:pk>', views.detail, name='detail')
]
```

Then you can reverse the url `notes/<int:pk>`.

```python
from django.utils import reverse
reverse('detail', 10)      # notes/10
reverse(views.detail, 10)  # works but not suggested
```

---

# `app_name` in URLConf

As names like `index`, `details` are common among route names. 

We can add a prefix to give the `index` route in different app a different name.

```python
app_name = 'notes'
urlpatterns = [
  path('notes/<int:pk>', views.detail, name='detail')
]
```

Now you should use `notes:detail` to reference this route.

## Examples

```jinja-html
<a href="{% url 'notes:detail' 10 %}">Link to #10</a>
```

---
layout: section
---

# Working with form

---

# Working with form 

The `<form>` tag is used to create a form in HTML file. 

There is usually a submit button in the form for submitting the data to the server.

```jinja-html
<form action="{% url 'notes:index' %}" method="POST">

{% csrf_token %} <!-- Learn more: https://developer.mozilla.org/zh-CN/docs/Glossary/CSRF -->

<div>
  <label name="language">Code</label>
  <input type="text" name="language" id="language">
</div>

<div>
  <label name="code">Code</label>
  <input type="text" name="code" id="code">
</div>
</form>
```

The content type of form submitting is `multipart/form-data`.

---

# Working with form

You can use:

- `request.method` for getting the method of a request
- `request.POST` for getting the POST data

```python
def index(request):
    if request.method == 'POST':
        print(request.POST)
        # do something with POST
    else:
        # do something with GET
```

Usage

```python
request.POST['code']          # get content of the `code` field
request.POST.get('language')  # get content of the `code` field
```

---

# Validating a form

Reference: [https://docs.djangoproject.com/zh-hans/4.0/topics/forms/](https://docs.djangoproject.com/zh-hans/4.0/topics/forms/)

Create a file called `forms.py` inside the `snippets` directory.

```python
# snippets/forms.py
from django import forms

class SnippetForm(forms.Form):
    # Render a <input> tag (default)
    language = forms.CharField(label='Language')
    # Render a <textarea> tag 
    code = forms.CharField(label='Code', widget=forms.Textarea)
```

Then we can use:

```python
from .forms import SnippetForm

def index(request):
    form = SnippetForm(request.POST)
    if form.valid():
        ...
```

---

# Rendering a form

We can directly use the `SnippetForm` to auto render a form.

```python
# snippets/views.py
def create(request):
    return render(request, 'create.html', context={ 'form': SnippetForm() })
```
Remember add `path('create', views.create, name='create')` to `urls.py`.

```jinja-html
<!-- snippets/templates/create.html -->
<form action="{% url 'notes:index' %}" method="POST">
{% csrf_token %} <!-- Learn more: https://developer.mozilla.org/zh-CN/docs/Glossary/CSRF -->
{{ form }}       <!-- the form -->
</form>
```

A label and an `input` tag (or other flag if other widget is used) will be generated for each field.

---

# Customizing the form

The built-in widgets (in `django.forms` package) supports settings attributes of the corresponding `input` element.

The attributes are passed as a `dict` to the widget class init function.

```jinja-html
#snippets/forms.py
from django import forms

class SnippetForm(forms.Form):
    language = forms.CharField(label='Language', widget=forms.TextInput(attrs={'class': 'bg-red-500'}))
    code = forms.CharField(label='Code', widget=forms.Textarea(attrs={'class': 'bg-red-500 rounded-sm'}))
```

Attributes are applied to the `input` tag, the `label` tag cannot be customized.

More customization can be done by creating a new widget class.

Learn more: [https://docs.djangoproject.com/en/4.0/ref/forms/widgets/#customizing-widget-instances](https://docs.djangoproject.com/en/4.0/ref/forms/widgets/#customizing-widget-instances)

---
layout: section
---

# Class based views

---

# Class based views

Processing `GET` and `POST` request in one function is hard to maintain.

We can use [class-based views](https://docs.djangoproject.com/en/4.0/topics/class-based-views/intro/)
to solve the problem.

The most basic class-based view is `django.views.View`

```python
from django.views import View
from django.shortcuts import render, redirect

class IndexView(View):
    def get(self, request):
        return render(request, 'index.html')
    def post(self, request):
        return redirect('snippets:detail', 1)
```

**Note**: the [redirect()](https://docs.djangoproject.com/en/4.0/topics/http/shortcuts/#redirect) function
returns a HttpResponse with `302 Found` status code, which tells the browser to redirect to another url.

---

# Class-based views

**Basic Views**

- [Template View](https://docs.djangoproject.com/en/4.0/ref/class-based-views/base/#templateview)
- [Redirect View](https://docs.djangoproject.com/en/4.0/ref/class-based-views/base/#redirectview)

**Generic display views** (Recommanded)

- [DetailView](https://docs.djangoproject.com/en/4.0/ref/class-based-views/generic-display/#detailview)
- [ListView](https://docs.djangoproject.com/en/4.0/ref/class-based-views/generic-display/#listview)

**Generic editing views** (Recommanded)

- [FormView](https://docs.djangoproject.com/en/4.0/ref/class-based-views/generic-editing/#formview)
- [CreateView](https://docs.djangoproject.com/en/4.0/ref/class-based-views/generic-editing/#createview)
- [UpdateView](https://docs.djangoproject.com/en/4.0/ref/class-based-views/generic-editing/#updateview)
- [DeleteView](https://docs.djangoproject.com/en/4.0/ref/class-based-views/generic-editing/#deleteview)

---
layout: section
---

# Vuex

A state management tool

---
layout: image-right
image: 'https://vuex.vuejs.org/vuex.png'
---

# Vuex

**Notice**: The official state management tool of Vue is now [pinia](https://pinia.vuejs.org).
The API is similar, try **pinia** if you want!

[Vuex](https://vuex.vuejs.org) can be used as a global state (can be accessed by all components) management tool.

It is useful when we have multiple components that share a common state:

- Multiple views may depend on the same piece of state
- Actions from different views may need to mutate the same piece of state

---

# Overview | Vuex

If you are using **@vue/cli** for initializing your app, you can find vuex configuration file in `store/index.js`.

It it devided into five parts: `state`, `getters`, `mutations`, `actions`, `modules`.

We will not focus on `modules` since it is not frequently used in small app development.

```js
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
  },
  getters: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
  }
})
```

---

# State | Vuex

> Reference: https://vuex.vuejs.org/guide/state.html#state

The state is an object that contians initial value of your global state object.

The usage of declaring state is similar to what we do in `data` in a Vue component.

```js
// store/index.js
export default new Vuex.Store({
  state: {
    counter: 1,
  },
})
```

We can get the state in a Vue component using its `computed` option with `this.$store`.

```js
// Component.vue
export default {
  computed: {
    counter() { return this.$store.state.counter }
  }
}
```

---

# Getters | Vuex

> Reference: https://vuex.vuejs.org/guide/getters.html

Some attributes are depend on state. 

Suppose we have a attribute called `isCounterGreaterThanFive` shoule if the counter is greater than 5,
we don't want to maintain a state with the same name.

Instead, we use `getters` (just like the `computed` options in a Vue component).

<div grid="~ cols-2 gap-4">

```js
// store/index.js
export default new Vuex.Store({
  state: {
    counter: 1
  },
  getters: {
    isCounterGreaterThanFive(state) { return state.counter > 5 }
  }
})
```

```js
// Component.vue
export default {
  computed: {
    isCounterGreaterThanFive() { return this.$state.getters.isCounterGreaterThanFive }
  }
}
```

</div>

---

# Mutations | Vuex

> Reference: https://vuex.vuejs.org/guide/mutations.html

In Vuex and similar libraries like Redux, it is not suggested to change the global state directly.
Committing a mutation is the **only** suggested way to update the state.

<div grid="~ cols-2 gap-4">

```js
// store/index.js
export default new Vuex.Store({
  state: {
    counter: 1
  },
  getters: {
    isCounterGreaterThanFive(state) { return state.counter > 5 }
  },
  mutations: {
    incCounter(state) {
      state.counter++
    }
  }
})
```

```js
// Component.vue
export default {
  computed: {
    counter() { return this.$store.state.counter }
    isCounterGreaterThanFive() { return this.$store.getters.isCounterGreaterThanFive }
  },
  methods: {
    incCounter() { this.$store.commit('incCounter') }
  }
}
```

</div>

---

# Actions | Vuex

> Reference: https://vuex.vuejs.org/guide/actions.html

Actions are similar to mutations. However, actions _commit_ mutations to update the state of directly modify it.

<div grid="~ cols-2 gap-4">

```js
// store/index.js
export default new Vuex.Store({
  state: {
    counter: 1
  },
  getters: {
    isCounterGreaterThanFive(state) { return state.counter > 5 }
  },
  mutations: {
    incCounter(state) {
      state.counter++
    }
  },
  actions: {
    incCounter(context) {
      context.commit('incCounter')
    }
  }
})
```

```js
// Component.vue
export default {
  computed: {
    counter() { return this.$store.state.counter }
    isCounterGreaterThanFive() { return this.$store.getters.isCounterGreaterThanFive }
  },
  methods: {
    incCounter() { this.$store.dispatch('incCounter') }
  }
}
```

</div>

---
layout: section
---

# Lifecycle of Vue Components

---

# Lifecycle Hooks

Some events are important to a Vue component, such as `create`, `mount`, `update` and `destroy`.

For each event, Vue provides two hooks for developers. A hook is a function that Vue will execute in corresponding stage.

- beforeCreate
- created
- beforeMount
- mounted
- beforeUpdate
- updated
- beforeDestroy
- destroyed

There is a figure showing the lifecycle: https://cn.vuejs.org/images/lifecycle.png

---
layout: section
---

# Thanks
