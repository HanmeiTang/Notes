# Initial set up guide

This is a work space setup for a brand-new laptop with Mac OSX system.

## Step 1: Install Xcode

First, installing XCode from App Store. To install Xcode command line tools, type xcode-select --install in a terminal.

```bash
$ xcode-select --install
```

Click through all the confirmation commands (Xcode is a large program so this might take a while to install depending on your internet connection).

## Step 2: Install Homebrew

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

To confirm Homebrew installed correctly, run this command:

```bash
$ brew doctor
Your system is ready to brew.
```

<!--
  ## Get enviroment from another machine
  You can also export the list of packages in an environment to a file, then include that file with your code. 
  This allows    other people to easily load all the dependencies for your code. Pip has similar functionality with 
  pip freeze > requirements.txt
-->


## Step 3: Get Miniconda (for general use) or Anaconda (for data science, 500 MB+)
1. Download from website:
  [Miniconda](https://docs.conda.io/en/latest/miniconda.html)
  [Anaconda](https://www.anaconda.com/distribution/#download-section) 
  
2. Alternatively, download using `curl` in terminal

```Bash
curl -o install.sh https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
bash install.sh
```

## Step 4: Upgrade all pacages

To avoid errors later, it's best to update all the packages in the default environment. In the terminal, run the following commands to upgrade all packages including conda itself.

```Bash
$ conda upgrade --all
```

Then upgrade Python to the latest version and install frequently used packages in our lab

```bash
$ conda update --yes python
$ conda install --yes ruamel.yaml numpy scipy pandas jupyter sympy matplotlib pandas seaborn git
```

Now let’s confirm which version was installed:

```bash
$ python --version
Python 3.7.3
```

## Step 5 (Optional) - Isolated environments

Conda provides the means for you to create isolated environments. It is
useful if you are going to work with lots of python packages that may have
incompatible dependencies. If you are planning to work exclusively on Materials
Virtual Lab stuff, you can skip this step. 

To create a new environment in conda, do

```shell
$ conda create -n my_env python
```

If you want to use python 2.7 for testing, type

```shell
$ conda create -n my_env python=2.7
```

To go to that environment, just type:

```shell
$ source activate my_env
```

## Step 6: IDE

An Integrated Development Environment (IDE) makes it easier for you to code and 
maintain good style, especially for Python. But this is purely a preference
thing. For members in the Materials Virtual Lab, unless you are sure you are
already a supremely good Python coder who can maintain good style without the
assistance of an IDE, you are required to use Pycharm as per directive from
Shyue Ping. Everyone in the group shares the same code base. Your errors cause
problems for others. 

Download the [community version fo Pycharm](http://www.jetbrains.com/pycharm)
or install it via `brew cask install`.

```bash
$ brew cask install pycharm-ce
```

It is unlikely you need anything more than the community version.

## Step 7: Other recommended software

Here are some recommended software. Most can be installed via homebrew via
`brew install` or `brew cask install`.  Note that you can use 
`brew cask install` to install many GUI apps, including Google Chrome
(google-chrome), Zoom (zoomus), etc. You can look for apps using
`brew cask search`.

* [Atom](https://atom.io/) editor: General purpose text editor for many
  languages, including python and latex. Make sure you install the relevant
  language support package for latex if you plan to use it.
  ```bash
  $ brew cask install atom
  ```
* iTerm2: A much better replacement for Terminal.
  ```bash
  $ brew cask install iterm2
  ```
* Alfred: Fast program launcher.
  ```bash
  $ brew cask install alfred
  ```
* coreutils: GNU version of core utilities like ls, etc., which are more updated
  than the version that Mac comes with.
  ```bash
  $ brew install coreutils
  ```
* tree: Directory exploration tool.
  ```bash
  $ brew install tree
  ```

## References
* [Install Python 3 on Mac](https://wsvincent.com/install-python3-mac/)
