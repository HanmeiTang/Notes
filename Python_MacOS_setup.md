# Initial set up guide

This is a work space setup for a brand-new laptop with Mac OSX system. I am trying to reproduce MAVRL initial setup guide, which was in Mavrl wiki but recently gone.

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

## Step 6: Get a GitHub account and request access to MAVRL group

Please ask the Github administrator to compelete this step.

## Step 7: Clone and setup the relevant Github repos

Before you setup the repos, it is generally advised that you keep all your
repos in a single directory. E.g., $HOME/repos.

### Pymatgen, pymatgen-db, custodian, fireworks

These are to be installed in developmental mode from source. You will be
working with these a lot.

```shell
$ git clone git@github.com:materialsproject/pymatgen.git            
$ cd pymatgen
$ python setup.py develop
```

Do the same for the pymatgen-db, custodian and fireworks repos.

### Pymacy

To be installed in developmental mode from source. You will be working with
this a lot as well. This is the private overall repo for the MAVRL.

```shell
$ git clone git@github.com:materialsvirtuallab/pymacy.git
$ cd pymacy
$ python setup.py develop
```

## Step 8: VASP Setup

You need the VASP psuedopotential files in order to generate VASP input files.
These are provided in the pymacy repo under resources. 

Add a VASP_PSP_DIR to your .pmgrc.yaml, by running the following.

```shell
$ pmg config --add PMG_VASP_PSP_DIR /path/to/pymacy/resources/VASP_PSP
```

Test that you have set it up correctly by typing:

```shell
$ python -c 'from pymatgen.io.vasp import Potcar; print(Potcar(["Li_sv", "O"]))'
```

There should be no errors. Otherwise, you have not done setup correctly.

## Step 9: IDE

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

## Step 10: Familiarize yourselves with git, python and pymatgen

Learn how to commit and push changes with git. The model is that you should be 
creating branches for anything that you do, and you should *commit often*.

Pymatgen has extensive documentation at http://pymatgen.org. Read and learn to
use it. A hour spent figuring out how to work with pymatgen will save you 100
hours over a year (and probably more as you become more familiar).

Read the materialsvirtuallab Coding guidelines, and follow them strictly.

## Step 11: Other recommended software

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
* Mendeley: Citation manager. This is not optional.
  ```bash
  $ brew cask install mendeley-desktop
  ```
* VESTA: For viewing crystal structures.
  ```bash
  $ brew cask install vesta
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
1. [Install Python 3 on Mac](https://wsvincent.com/install-python3-mac/)
2. [mavrl_setup_for_mac.md](https://github.com/materialsvirtuallab/pymacy/edit/master/resources/mavrl_setup_for_mac.md)
