# Handy conda commands
This is a note after taking Udacity Data Analyst NanoDegree for Anaconda. The application `conda` is a package and environment manager. 

## 1. Managing Packages
Once you have Anaconda installed, managing packages is fairly straightforward. To install a package, type conda install package_name in your terminal. For example, to install numpy, type conda install numpy.

```shell
$ conda install numpy scipy pandas
```

It's also possible to specify which version of a package you want by adding the version number such as 
```SHELL
$ conda install numpy=1.10.
```

Conda also automatically installs dependencies for you. For example scipy depends on numpy, it uses and requires numpy. If you install just scipy (`conda install scipy`), Conda will also install numpy if it isn't already installed.

To uninstall, use 

```SHELL
$ conda remove numpy
```

To update a package, use
```shell
$ conda update numpy
```

If you want to update all packages in an environment, which is often useful, use 
```shell
$ conda update --all
```
And finally, to list installed packages, it's `conda list` which you've seen before.

## 2. Managing Enviroments

A really useful feature is sharing environments so others can install all the packages used in your code, with the correct versions. You can save the packages to a YAML file with 

```shell
$ conda env export --name base > environment.yaml
```

The first part `conda env export` writes out all the packages in the activated virtual environment, including the Python version. And to create an environment from an environment file use

```shell
$ conda env create -f environment.yaml
```

To list all env:
```shell
$ conda env list
```
To remove an enviroemnt

```shell
$ conda env remove -n env_name 
```

## 3. Best practices
* Using environments. One thing that’s helped me tremendously is having separate environments for Python 2 and Python 3.

```shell
$ conda create -n py2 python=2
$ conda create -n py3 python=3
```

* Sharing environments
When sharing your code on GitHub, it's good practice to make an environment file and include it in the repository. This will make it easier for people to install all the dependencies for your code. I also usually include a pip `requirements.txt` file using `pip freeze > requirements.txt` for people not using conda.

* Conda cheatsheet [link](https://docs.conda.io/projects/conda/en/latest/user-guide/cheatsheet.html)
