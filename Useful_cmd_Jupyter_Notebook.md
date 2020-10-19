# Handy Jupyter notebook commands
This is a note after taking Udacity Data Analyst NanoDegree for Jupyter notebook. The notebook is a web application that allows you to combine explanatory text, math equations, code, and visualizations all in one easily sharable document.

## Creating a slideshow

### 1.1 View and configue slideshow

[Example](https://nbviewer.jupyter.org/format/slides/github/jorisvandenbossche/2015-PyDataParis/blob/master/pandas_introduction.ipynb#/)

Go to `View > Cell Toolbar > Slideshow` at menu. This will show a menu dropdown on each cell that lets you choose how the cell shows up in the slideshow.

**Slides** are full slides that you move through left to right. **Sub-slides** show up in the slideshow by pressing up or down. **Fragments** are hidden at first, then appear with a button press. You can skip cells in the slideshow with **Skip** and **Notes** leaves the cell as speaker notes.

### 1.2 Running the slideshow

To create the slideshow from the notebook file, you'll need to use `nbconvert`:

```shell
$ jupyter nbconvert notebook.ipynb --to slides
```

This just converts the notebook to the necessary files for the slideshow, but you need to serve it with an HTTP server to actually see the presentation.

To convert it and immediately see it, use

```shell
$ jupyter nbconvert notebook.ipynb --to slides --post serve
```
This will open up the slideshow in your browser so you can present it.

## 2. Converting notebooks

For example, to convert a notebook to an HTML file, in your terminal use


```shell
$ jupyter nbconvert --to html notebook.ipynb
```

Converting to HTML is useful for sharing your notebooks with others who aren't using notebooks. Markdown is great for including a notebook in blogs and other text editors that accept Markdown formatting.
