---
layout: page
title: Tags
permalink: /tags/
---

{% capture site_tags %}{% for tag in site.tags %}{{ tag | first | downcase }}#{{ tag | first }}{% unless forloop.last %},{% endunless %}{% endfor %}{% endcapture %}
{% assign tag_hashes = site_tags | split:',' | sort %}
<ul class="list-group">
{% for hash in tag_hashes %}
  {% assign keyValue = hash | split: '#' %}
  {% capture tag_word %}{{ keyValue[1] | strip_newlines }}{% endcapture %}
  <li class="list-group-item">
    <a href="{{ site.url }}{{ site.baseurl }}/tag/{{ tag_word | downcase }}.html">
      {{ tag_word }}
    </a>
    <span class="badge pull-right">( {{ site.tags[tag_word].size }} )</span>
  </li>
{% endfor %}
</ul>