![](BashFigure1.jpeg)
================
Center for Health Data Science, July 2022

-   <a href="#introduction" id="toc-introduction">Introduction</a>
-   <a href="#exercise-1-navigating-files-and-directories"
    id="toc-exercise-1-navigating-files-and-directories">Exercise 1:
    Navigating Files and Directories</a>
-   <a href="#exercise-2-project-organization"
    id="toc-exercise-2-project-organization">Exercise 2: Project
    Organization</a>
-   <a href="#exercise-3-working-with-files-and-directories"
    id="toc-exercise-3-working-with-files-and-directories">Exercise 3:
    Working with Files and Directories</a>
-   <a href="#exercise-4-more-bash-commands"
    id="toc-exercise-4-more-bash-commands">Exercise 4: More Bash
    Commands</a>
-   <a href="#exercise-5-redirection--pipes"
    id="toc-exercise-5-redirection--pipes">Exercise 5: Redirection &amp;
    Pipes</a>
-   <a href="#exercise-6-editors-and-shell-scripts"
    id="toc-exercise-6-editors-and-shell-scripts">Exercise 6: Editors and
    Shell scripts</a>
-   <a href="#exercise-7-software-installation-upkeep--more"
    id="toc-exercise-7-software-installation-upkeep--more">Exercise 7:
    Software Installation, Upkeep &amp; More</a>
-   <a href="#exercise-8-loops-and-workflow-language"
    id="toc-exercise-8-loops-and-workflow-language">Exercise 8: Loops and
    Workflow Language</a>

------------------------------------------------------------------------

## Introduction

This markdown document contains of exercises for the introductory
workshop on command line use, entitled `Just Bash It`, developed and
hosted by Center for Health Data Science (HeaDS) at the Faculty of
Health and Medical Sciences ([HeaDS](https://heads.ku.dk/)), in
collaboration with the University Library
([KUB](https://kub.kb.dk/datalab)) Data Lab.  
This one day workshop is targeted at biomedical and health researchers
at the University of Copenhagen with no prior experience in bash command
line use.

The workshop consists of a slideshow with slides to each section, in
addition to hands-on presentations (code-along) and accompanying
exercises.

## Exercise 1: Navigating Files and Directories

On your command line, go to where you have downloaded the course
materials. If the folder is zipped, unzip it. (This might be easier to
do with the graphical user interface).

1.  List the files and directories in the top directory `Just-Bash-It`.
    Which file was last updated? Which file is the largest?

2.  Go into the `Examples` folder and list its contents.

3.  Move the text file from the `images` folder to the `docs` folder.
    Confirm that is is in the right place.

4.  Make a copy of the text file.

5.  Rename the copy.

6.  Remove the copy.

## Exercise 2: Project Organization

Let’s get structured!

1.  Make a `projects` directory at `/home/user/Desktop` on your computer
    with all the sub-folders shown on **slide 15** in the slideshow. You
    are free to name the project within the `projects` folder whatever
    you would like,
    e.g. `Just_Bash_It, Intro_to_command_line, First_Project, ...`.  
    **Cheat Sheet 1** in the slideshow will have the commands you need.

You should have downloaded the course materials including the raw data
files to you computer, maybe it is in your downloads folder or perhaps
you moved it somewhere else.

2.  Using the command-line, navigate to where you downloaded the course
    materials an go to the directory named `Data`, here you should see
    three files, all with the extension `.gz`. Move these three files to
    the project directory you have made and place them in the correct
    sub-folder.

3.  How large are the data files you moved from the course materials?

4.  Check the permissions of the data files from the course materials.
    Do you have permission to `read`, `write` and `execute` them? If you
    are not allowed to execute the, what is the reason for this?

5.  Make a new file called `readme` within your project directory.

## Exercise 3: Working with Files and Directories

1.  Go to your project directory and edit the `readme` file you made in
    *Exercise 2* using the `nano` editor. A `readme` file should contain
    information about what a certain directory contains, its purpose and
    who owns it/is the editor.

2.  Move to the sub-directory `Data/Raw` here you should have the three
    data files you moved from the course material directory.

Two of these files are `fastq` files, they contain RNAseq reads from a
bulk-RNA sequencing experiment using Arabidopsis thaliana (thale cress).
The extension `_1` and `_2` denote that reads are paired-end (e.g. read
1 and read 2). The third file, `gff`, contains annotations of genes and
other genomic feature from the organism of study, Arabidopsis thaliana.

3.  Expand the `.gff.gz` annotation file and make sure you keep the
    compressed version.  
    **HINT:** look into what flags/arguments need to be specified when
    decompressing).

4.  Try out the commands `less, cat, head, tail` on the expanded `.gff`
    file. Note what it contains.

5.  Look at the content of one of the two `fq.gz` files with RNA
    sequencing read, **N.B.** this time without expanding the file!

## Exercise 4: More Bash Commands

Suggestion for Exercise:

1.  In the course material, find the file ‘patients.txt’ and navigate to
    the folder where it is.

2.  Have a look at the content of the file.

3.  Move the file into your directory structure into the `data/raw`
    subfolder and navigate there. Confirm that the file is in this
    folder with i.e. `ls`.

4.  How many lines does the file contain?

5.  Cut out the first column of the file.

6.  Cut out the first and third column.

7.  Sort the file by the age column from lowest to highest. Then,
    reverse the sort so you have the oldest patients on top.

8.  Grep only rows containing patients at ‘Rigshospitalet’.

## Exercise 5: Redirection & Pipes

Again, using patients.txt do the following:

1.  Sort the file by the age column and redirect the output into a new
    file. View the new file and confirm that it is sorted correctly.

2.  Redo 1 but this time redirect the output to a file in the
    `data/generated` directory. The original file `patients.txt` should
    be in `data/raw`.

3.  Cut out the column that describes the hospital, sort the output and
    count the number of unique elements (using `uniq`, as shown in the
    slides). Build this up step by step if you have trouble. Do you
    notice a problem with the data in the file?

4.  Grep only rows containing patients at ‘Rigshospitalet’ and sort them
    by their satisfaction from lowest to highest.

## Exercise 6: Editors and Shell scripts

Write a short script that implements the tasks 5, 6 and 7 from exercise
4 on a file supplied by the user (given as a command line argument).
Test it and confirm that it works.

## Exercise 7: Software Installation, Upkeep & More

We install something light-weight and useful.

## Exercise 8: Loops and Workflow Language

Do we do something on the files in data???
