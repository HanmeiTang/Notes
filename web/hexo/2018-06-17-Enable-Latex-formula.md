---
title: Enable Latex Formula
tags:
- "Hexo"
categories: 
- "Tutorials"
- Guide
toc: true
mathjax: true
comments: false
date: 2018-06-17 11:45:15
---

## Configuration & installation
A full guide and detailed explanation can be found in References section.

### Enable Latex formula in theme config file `next/_config.yml`
```ymal
math:
  enable: true
  engine: mathjax
```

<!-- more -->

### Install Render Engine (default : MathJax)
```bash
$ npm un hexo-renderer-marked --save

$ npm i hexo-renderer-pandoc --save

# Finally, run standard Hexo generate, deploy process or start the server
$ hexo clean && hexo g && hexo s
```


### To show equation, set in post front-matter
```markdown
mathjax: true
```

## Test
This is a formula test:

$$ e^{ix}=\cos x + i\sin x $$

Left aligned:

$ e^{ix}=\cos x + i\sin x $

## References
1. *[GitHub - hexo-theme-next](https://github.com/theme-next/hexo-theme-next/blob/master/docs/MATH.md)*
