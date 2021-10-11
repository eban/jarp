---
permalink: /foo.html
---
<ul>
  {% for pages in site.pages %}
    <li>
      <a href="{{ pages.url }}">{{ pages.title }}</a>
    </li>
  {% endfor %}
</ul>
