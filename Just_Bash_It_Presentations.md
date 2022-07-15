![](BashFigure1.jpeg)
================
Center for Health Data Science, July 2022

-   <a href="#introduction" id="toc-introduction">Introduction</a>
-   <a href="#presentation-1-navigating-files-and-directories"
    id="toc-presentation-1-navigating-files-and-directories">Presentation 1:
    Navigating Files and Directories</a>
-   <a href="#presentation-2-project-organization"
    id="toc-presentation-2-project-organization">Presentation 2: Project
    Organization</a>
-   <a href="#presentation-3-working-with-files-and-directories"
    id="toc-presentation-3-working-with-files-and-directories">Presentation
    3: Working with Files and Directories</a>
-   <a href="#presentation-4-commands-redirection--pipes"
    id="toc-presentation-4-commands-redirection--pipes">Presentation 4:
    Commands, Redirection &amp; Pipes</a>
-   <a href="#presentation-5-more-bash-commands"
    id="toc-presentation-5-more-bash-commands">Presentation 5: More Bash
    Commands</a>
-   <a href="#presentation-6-editors-and-shell-scripts"
    id="toc-presentation-6-editors-and-shell-scripts">Presentation 6:
    Editors and Shell scripts</a>
-   <a href="#presentation-7-loops-and-workflow-language"
    id="toc-presentation-7-loops-and-workflow-language">Presentation 7:
    Loops and Workflow Language</a>
-   <a href="#presentation-8-software-installation-upkeep--more"
    id="toc-presentation-8-software-installation-upkeep--more">Presentation
    8: Software Installation, Upkeep &amp; More</a>

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

``` bash
pwd
```

    ## /Users/kgx936/Desktop/HeaDS/GitHub_repos/Just-Bash-It

## Presentation 2: Project Organization

In this section we show participants how to set up a good directory
structure. TWorkshop teachers should have setup a directory structure
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

## Presentation 4: Commands, Redirection & Pipes

## Presentation 5: More Bash Commands

## Presentation 6: Editors and Shell scripts

## Presentation 7: Loops and Workflow Language

## Presentation 8: Software Installation, Upkeep & More
