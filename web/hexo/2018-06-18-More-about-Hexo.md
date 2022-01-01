---
title: More about Hexo
tags:
- Hexo
categories:
- Tutorials
- Guide

toc: true
mathjax: true
comments: false
sitemap: true
no-emoji: false
markdown-it-checkbox: true
notshow: false
date: 2018-06-17 22:06:15
---

This is a collection of minor issues I got while using Hexo blog.

## Add your sitemap [$^{[1]}$](https://github.com/hexojs/hexo-generator-sitemap)
The outcome is not as what I expected... but anyway, in case someone wants to have a try. I disabled this plugin and removed the page from my menu after I saw its ugly local page.

### Installation
``` bash
Install `hexo-generator-sitemap` plugin
$ npm install hexo-generator-sitemap --save

## Generate and deploy
$ hexo clean && hexo g && hexo s
```

### Edit `_config.yml`
```yaml
sitemap:
    path: sitemap.xml
```

### Edit `next/_config.yml`
```yaml
menu:
    sitemap: /sitemap.xml || sitemap
```

<!-- more -->

## Add Emojis in your blog [$^{[2]}$](https://www.npmjs.com/package/hexo-filter-github-emojis)
I want to add a "cake" Emoji to my "about" page for my cats.

### Installation
```bash
$ npm install hexo-filter-github-emojis --save

## Generate and deploy
$ hexo clean && hexo g && hexo s
```

### Edit `_config.yml`
```yaml
githubEmojis:
    enable: true
    className: github-emoji
    unicode: false
    styles:
        display: inline
        vertical-align: bottom
    localEmojis:
        arrow_left: https://path/to/arrow_left.png
        arrow_right: https://path/to/arrow_right.png
```

### Test
This is a Emoji :sparkles:.
Well. I don't like it either...
But I find copy-paste from *[EmojiPedia](https://emojipedia.org/)* is much easier... 😂😂😂

## Enable tags and categories [$^{[3]}$](https://linlif.github.io/2017/05/27/Hexo%E4%BD%BF%E7%94%A8%E6%94%BB%E7%95%A5-%E6%B7%BB%E5%8A%A0%E5%88%86%E7%B1%BB%E5%8F%8A%E6%A0%87%E7%AD%BE/)
I tried on the first day using Hexo but I got nothing more than two blank pages, until I found a tutorial just now.

```bash
## Create `categories` and `tags` pages
$ hexo new page categories
$ hexo new page tags
```

### Edit `source/categories/index.md`
```markdown
---
title: categories
date: 2018-06-17 23:20:26
type: "categories"
---
```

### Edit `source/tags/index.md`
```markdown
---
title: tags
date: 2018-06-17 23:20:26
type: "tags"
---
```

## ~~How to render `[]`? [$^{[4]}$](http://baishusama.github.io/2016/12/24/hexo-render-markdown-it-and-its-plugins/)~~
There are lots of differentiation from the markdown I am used to:
1. I want `[]` to be rendered as a blank check box.
2. yaml format cannot be rendered, keywords are not highlighted.

### Installation

```bash
## Go to source folder and uninstall default markdown engine
$ npm un hexo-renderer-marked --save

## Install `markdown-it`
$ npm i hexo-renderer-markdown-it --save

## Install `markdown-it` plugins
$ cd node_modules/hexo-renderer-markdown-it/
$ npm install markdown-it-checkbox --save

## Reboot server
$ hexo clean && hexo g && hexo s
```

### Edit `_config.yml`

```yaml
## Markdown-it config
### Docs: https://github.com/celsomiranda/hexo-renderer-markdown-it/wiki
markdown:
  render:
    html: true # Doesn't escape HTML content so the tags will appear as html.
    xhtmlOut: false # Parser will not produce XHTML compliant code.
    breaks: true # Parser produces `<br>` tags every time there is a line break in the source document.
    linkify: false # Returns text links as text.
    typographer: true # Substitution of common typographical elements will take place.
    quotes: '“”‘’' # "double" will be turned into “single”
                   # 'single' will be turned into ‘single’
  plugins:
    + markdown-it-abbr
    + markdown-it-checkbox
    + markdown-it-emoji
    + markdown-it-footnote
    + markdown-it-ins
    + markdown-it-sub
    + markdown-it-sup
  anchors:
    level: 2 # Minimum level for ID creation. (Ex. h2 to h6)
    collisionSuffix: 'v' # A suffix that is prepended to the number given if the ID is repeated.
    permalink: true # If true, creates an anchor tag with a permalink besides the heading.
    permalinkClass: header-anchor # Class used for the permalink anchor tag.
    permalinkSymbol: ¶ # The symbol used to make the permalink.
```

[x] I have got checkbox activated. Looks I am failed.

## How to render Latex formula?

Please refer to my another blog:
*[Enable Latex formula](/2018/06/17/2018-06-17-Enable-Latex-formula/)*

## Set a blog to invisible [$^{[5]}$](https://www.jianshu.com/p/79fe9fb9dfa0)

Set a new customized variable `notshow: true` in front-matter to hide a blog. To do this, one needs to modify the following part in `theme/layout/index.swig`.

### Edit `theme/layout/index.swig` to enable `notshow`
```javascript
{% block content %}
  <section id="posts" class="posts-expand">
    {% for post in page.posts %}

        // New IF block
    {% if post.notshow != true %}
        {{ post_template.render(post, true) }}
    {% endif %}
    // End of the block

    {% endfor %}
  </section>

  {% include '_partials/pagination.swig' %}
{% endblock %}
```
## Add customized menu item [$^{[5]}$](https://www.jianshu.com/p/79fe9fb9dfa0)
This is convenient, just link to its directory and everything is done. For example, add a new page `Cats`. Using the same trick, one can also create a `gallery` page as a collection of all pictures.

### Edit `themes/_config.yml`
```yaml
menu:
  home: / || graduation-cap
  about: /about/ || info-circle
  Archives: /archives/ || minus-square
  Interests: /Interests/ || bookmark
  Cats: /tags/Cats || paw
  Gallery: /tags/Photography || camera
  #categories: /categories/ || th
  #tags: /tags/ || hashtag
```

## Generate sidebar tag cloud [$^{[6]}$](https://www.npmjs.com/package/hexo-tag-cloud)

### Installation
Go into your hexo system folder, and add dependance `"hexo-tag-cloud": "2.0.*"` to package.json and run:

```bash
$ npm install
```

### Edit source code

Go to the theme folder and change `next/layout/_macro/sidebar.swig`. Note that `<h3 class="widget-title">Tag Cloud</h3>` sets the title of this widget to be `Tag Cloud`.

```javascript
{% if site.tags.length > 1 %}
<script type="text/javascript" charset="utf-8" src="/js/tagcloud.js"></script>
<script type="text/javascript" charset="utf-8" src="/js/tagcanvas.js"></script>
<div class="widget-wrap">
    <h3 class="widget-title">Tag Cloud</h3>
    <div id="myCanvasContainer" class="widget tagcloud">
        <canvas width="250" height="250" id="resCanvas" style="width=100%">
            {{ list_tags() }}
        </canvas>
    </div>
</div>
{% endif %}
```

### More customizations after changing `_config.yml`.

```
## hexo-tag-cloud
tag_cloud:
    textFont: Trebuchet MS, Helvetica
    textColour: \#333
    textHeight: 25
    outlineColour: \#E2E1D1
```

### Finally, apply the change.
```bash
$ hexo clean && hexo g && hexo s
```

## Change default file name format
This can be change using default variables in `_config.yml` file:

```yaml
## Writing
new_post_name: :year-:month-:day-:title.md # File name of new posts
```

### Test filename
```bash
$ hexo new test
> INFO  Created: ~/bin/HanmeiTang.github.io/source/_posts/2018-06-18-test.md
```

## Add search page to sidebar [$^{[7]}$](https://github.com/wzpan/hexo-generator-search)
### Installation
```bash
$ npm install hexo-generator-search --save
```
### Configuration
#### Edit `_config.yml`

```ymal
search:
  path: search.xml
  field: post  # page, all
```

#### Edit `theme/_config.yml `
```yaml
local_search:
  enable: true
```

#### Restart
```bash
$ hexo clean && hexo g && hexo s
```

## Add sidebar avatar

### Edit `theme/_config.yml`
```ymal
## Sidebar Avatar
avatar:
   url: /content/images/2018/06/2018-06-18-avatar.jpg
```

## Change favicon
### Create your figures
This winter plum blossom (Prunus Mei) PNG took me some hours...

*********

<img src="/content/images/favicon.png" width="200px" height="200px" align="bottom">

*********

### Edit `_config.yml`
```yaml
favicon:
  small: /content/images/favicon.png
  medium: /content/images/favicon.png
```


## Encrypt blog [$^{[8]}$](https://www.npmjs.com/package/hexo-blog-encrypt)

### Installation
Add `"hexo-blog-encrypt": "2.0.*"` to hexo package.json.

```bash
$ npm install

# Reload
$ hexo clean && hexo g && hexo s
```

### Configuration
Edit `_config.yml`
```markdown
# Security
encrypt:
    enable: true
```
For a private blog, the following is an front-matter example.

```markdown
---
title: Hello World
date: 2016-03-30 21:18:02
password: hello
abstract: Welcome.
message: Welcome.
---
```

## Create a handy workflow
Move to blog directory, type "hexo s" and move to `_post` folder... I want to make this simpler. My solution is Alfred. The following figure shows the basic configuration of this workflow

[![Alfred workflow](/content/images/2018/06/2018-06-23-Alfred-wf.png)](/content/images/2018/06/2018-06-23-Alfred-wf.png)

### The “blog” Keyword block configuration

<img src="/content/images/2018/06/2018-06-23-Alfred-keyword.png" width="600px" align="bottom">

### The first and second “Terminal Command” block
```bash
# Launch using the given port

cd $HOME/bin/hexo-site
hexo s -p {query}

# Move to _post folder
cd $HOME/bin/hexo-site/source/_posts
```
### The “localhost” Open URL block
```javascript
http://localhost:{query}/
```
### View result
[![Alfred workflow](/content/images/2018/06/2018-06-23-Alfred-command.png)](/content/images/2018/06/2018-06-23-Alfred-command.png)

## References
1. *[GitHub - Generate Sitemap](https://github.com/hexojs/hexo-generator-sitemap)*
2. *[GitHub - hexo-filter-github-emojis](https://www.npmjs.com/package/hexo-filter-github-emojis)*
3. *[Hexo使用攻略-添加分类及标签](https://linlif.github.io/2017/05/27/Hexo%E4%BD%BF%E7%94%A8%E6%94%BB%E7%95%A5-%E6%B7%BB%E5%8A%A0%E5%88%86%E7%B1%BB%E5%8F%8A%E6%A0%87%E7%AD%BE/)*
4. *[Hexo markdown-it and its plugsins](http://baishusama.github.io/2016/12/24/hexo-render-markdown-it-and-its-plugins/)*
5. *[Hexo 设置首页隐藏指定文章](https://www.jianshu.com/p/79fe9fb9dfa0)*
6. *[npm hexo-tag-cloud](https://www.npmjs.com/package/hexo-tag-cloud)*
7. *[npm hexo-generator-search](https://github.com/wzpan/hexo-generator-search)*
8. *[npm hexo-blog-encrypt](https://www.npmjs.com/package/hexo-blog-encrypt)*
