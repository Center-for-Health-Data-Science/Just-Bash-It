![](BashFigure1.jpeg)
================
Center for Health Data Science, July 2022

-   [Introduction](#introduction)
-   [Presentation 1: Navigating Files and
    Directories](#presentation-1-navigating-files-and-directories)
-   [Presentation 2: Project
    Organization](#presentation-2-project-organization)
-   [Presentation 3: Working with Files and
    Directories](#presentation-3-working-with-files-and-directories)
-   [Presentation 4: More Bash
    Commands](#presentation-4-more-bash-commands)
-   [Presentation 5: Redirection &
    Pipes](#presentation-5-redirection--pipes)
-   [Presentation 6: Editors and Shell
    scripts](#presentation-6-editors-and-shell-scripts)
-   [Presentation 7: Loops and Workflow
    Language](#presentation-7-loops-and-workflow-language)
-   [Presentation 8: Software Installation, Upkeep &
    More](#presentation-8-software-installation-upkeep--more)

## Introduction

This document contains the hands-on `presentations` for the introductory
workshop on command line use, entitled `Just Bash It`. It is meant to
aid workshop teachers to recall what to show course participants in the
code along session.  
Each section in the slides-show is followed by a **cheat sheet**
containing the commands used in each of the sections below. The **cheat
sheet** is intended for participants to look at and recall bash commands
used in a given session.

The `Just Bash It` workshop is developed and hosted by Center for Health
Data Science (HeaDS) at the Faculty of Health and Medical Sciences
([HeaDS](https://heads.ku.dk/)), in collaboration with the University
Library ([KUB](https://kub.kb.dk/datalab)) Data Lab.

## Presentation 1: Navigating Files and Directories

In this section we introduce the directory tree and show how to move
around, list files and directories and what paths are.

Generally, whenever a command is written on a slide, you should
demonstrate it.

``` bash
pwd
```

``` bash
ls 

ls -F

ls -lht

ls *
```

``` bash
cd
```

``` bash
man ls

ls --help
```

## Presentation 2: Project Organization

In this section we show participants how to set up a good directory
structure. Workshop teachers should have setup a directory structure
like the one shown on slide 15.

1.  Under home/user/(Desktop \| Documents) show the directory `projects`
    which contains the project at hand. Reiterate commands `cd`, `pwd`
    and `ls`.

``` bash
cd
pwd
ls
```

2.  Move around the subdirectories in the directory `Just_Bash_It`. Make
    a folder which is missing, show `mkdir` and add a `readme` file to
    the dir using `touch`. Also make a mistake and reiterate `rm`.

``` bash
mkdir
touch
rm
```

3.  Go to the raw data folder and use `ls` and `du` options to show file
    sizes and file permission settings.

``` bash
ls -l *
ls -al *
ls -lh *

ls -l filename 
ls -al dir

du -sh
du -sh filename
du -sh dir
```

## Presentation 3: Working with Files and Directories

1.  View the content of a file with different commands. Use a readme
    file from a github repo as an example.

``` bash
cat 
less
head -n
tail -n
```

2.  Show editors: `nano, vim and emacs`. Edit a `readme` file made under
    the project structure. Add a line of text with each editor and show
    and option or two. Save the changes quit and use less to view it.

## Presentation 4: More Bash Commands

## Presentation 5: Redirection & Pipes

## Presentation 6: Editors and Shell scripts

## Presentation 7: Loops and Workflow Language

## Presentation 8: Software Installation, Upkeep & More
