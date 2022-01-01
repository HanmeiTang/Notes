---
title: Advanced Use of Markdown
tags:
  - Markdown
  - Hexo
categories:
  - Tutorials
  - Guide
toc: true
mathjax: true
sitemap: true
no-emoji: false
notshow: false
comments: false
date: 2018-06-18 23:49:43
---

This post includes some useful tricks more than common usages.

## Markdown syntax overview

Markdown was created to be easy to read, easy to write, and still readable in plain text format.

> Markdown’s syntax is intended for one purpose: to be used as a format for writing for the web.
>
> Thus, Markdown’s formatting syntax only addresses issues that can be conveyed in __plain text__.

## Comments and blank lines
To add some comments:
`<!-- the comments -->` or `[//]: # ( the comments )`

To create one blank line:
`<br>`

## Tables

A useful online Markdown table tool [Table Generator](http://www.tablesgenerator.com/markdown_tables). The following is one example from above site, which exemplifies left/center/right aligned cells. (It seems that Hexo cannot render this aligned words properly. Maybe I need to install some plugins.)

> GFM Markdown table syntax is quite simple. It does not allow row or cell spanning as well as putting multi-line text in a cell. The first row is always the header followed by an extra line with dashes "-" and optional colons ":" for forcing column alignment.

| Tables   |      Are      |  Cool |
|----------|:-------------:|------:|
| col 1 is |  left-aligned | $1600 |
| col 2 is |    centered   |   $12 |
| col 3 is | right-aligned |    $1 |

<!-- more -->

## Figures
The following insert a figure and link it to itself. Note this figure is transparent.

```markdown
[![Some dummy name](/content/images/favicon.png)](/content/images/favicon.png)
```

[![Some dummy name](/content/images/favicon.png)](/content/images/favicon.png)

If I want it to be smaller.

`<img src="/content/images/favicon.png" width="200px" height="200px">`

<img src="/content/images/favicon.png" width="200px" height="200px" align="middle" align="middle">


## Customize text

### Basic syntax
```markdown
<!--Bold-->
**this is bold text 1**
__this is bold text 2__
```

**this is bold text 1**

__this is bold text 2__

```markdown
<!--Italic-->
*this is Italic text 1*
_this is Italic text 2_
```

*this is Italic text 1*

_this is Italic text 2_


```markdown
<!--Strike-->
~~this is strike through text 1~~
<s>this is strike through text 2</s>
```

~~this is strike through text 1~~

<s>this is strike through text 2</s>

```markdown
<!--Blockquotes-->
> this is a blockquote of text
> > this is another blockquote of text
```

> this is a blockquote of text
> > this is another blockquote of text


```markdown
<!--Underline-->
<u>this is underlined text 1</u>
<span style="text-decoration:underline">this is underlined text 2</span>
```
<u>this is underlined text 1</u>

<span style="text-decoration:underline">this is underlined text 2</span>

### Font color
Named color can be found at [HTML Color Names](https://www.w3schools.com/Colors/colors_names.asp).

```markdown
<!--Use font colors-->
<span style="color: OliveDrab">this is text with color OliveDrab</span>

<!--Use hex color-->
<span style="color: #be0000">this is text with color #be0000</span>

<!--Change background color-->
<span style="background-color: #0099aa">this is text with background color</span>
```

<span style="color: OliveDrab">this is text with color OliveDrab</span>

<span style="color: #be0000">this is text with color #be0000</span>

<span style="background-color: #0099aa">this is text with background color</span>

### Font and font size

```markdown
<!--Change font-family-->
<span style="color:#008fb3; font-family: 'Gill Sans'">this is text with font Gill Sans</span>

<!--Change font size use span tag-->
<span style="color:#006680; font-family: 'Gill Sans'; font-size: 2em;">this is text with font size 2em</span>

<!--Change font size use font tag, not supported in HTML5-->
<font size="3" color="#cc6600" face="Gill Sans">This is not supported in HTML5!</font>
```

<span style="color:#008fb3; font-family: 'Gill Sans'">this is text with font Gill Sans</span>

<span style="color:#006680; font-family: 'Gill Sans'; font-size: 2em;">this is text with font size 2em</span>

<font size="3" color="#cc6600" face="Gill Sans">This is not supported in HTML5!</font>


### Text alignment
Markdown doesn't support alignment directly, but this can be done using HTML format as a trick.

```markdown
<!--Center aligned-->
<center>This is centered text.</center>

<!--Left aligned-->
<p align="left">This is left-aligned.</p>

<!--Right aligned-->
<p align="right">This is right-aligned.</p>
```
 - <center>This is centered text.</center>
 - <p align="left">This is left-aligned.</p>
 - <p align="right">This is right-aligned.</p>

## References
1. *[Table Generator](http://www.tablesgenerator.com/markdown_tables)*
2. *[Markdown Syntax Guide](https://sourceforge.net/p/hexo/wiki/markdown_syntax/)*
