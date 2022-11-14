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
-   [Presentation 4: More Bash Commands - Part 1: wc, sed &
    cut](#presentation-4-more-bash-commands---part-1-wc-sed--cut)
-   [Presentation 4: More Bash Commands - Part 1: sort, grep &
    awk](#presentation-4-more-bash-commands---part-1-sort-grep--awk)
-   [Presentation 5: Redirection &
    Pipes](#presentation-5-redirection--pipes)
-   [Presentation 6: Shell Scripts and
    Loops](#presentation-6-shell-scripts-and-loops)
-   [Presentation 7: Software Installation, Upkeep &
    More](#presentation-7-software-installation-upkeep--more)

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

List files

``` bash
ls 
ls -F

ls -l
ls -lh
ls -lht


ls -l patients.txt 
```

List hidden files

``` bash
ls -al
```

Move directories

``` bash
cd
```

Help page for command

``` bash
man ls

ls --help
```

Working with files: mv

``` bash
cd Just-Bash-It/Examples
ls *
cd images
pwd
mv mytextfile.txt ../docs 
ls
cd ../
ls *
cd docs/
mv mytextfile.txt my_text_file.tx
ls
```

Working with files: cp and rm

``` bash
cp my_text_file.txt text_copy.txt
ls
rm text_copy.txt
```

Anatomy of a command:

``` bash
ls -lh
ls -l h #doesn't work! Because it interprets 'h' as the file or directory to work on
ls -l -h #this works again
```

## Presentation 2: Project Organization

In this section we show participants how to set up a good directory
structure. Workshop teachers should have setup a directory structure
like the one shown on slide 15.

1.  Under home/user/(Desktop \| Documents) show the directory `projects`
    which contains the project at hand. Reiterate commands `cd`, `pwd`
    and `ls`.

``` bash
pwd
ls
```

2.  Move around the sub-directories in the directory `Just_Bash_It`.
    Make a folder which is missing, show `mkdir` and add a `readme` file
    to the dir using `touch`. Also make a mistake and reiterate `rm`.

``` bash
mkdir
touch
rm
```

3.  Go to the raw data folder and use `ls` and `du` options to show file
    sizes and file permission settings.

``` bash
du -sh  *
du -sh patients.txt

du -sh dir *
```

``` bash
ls -al
ls -al *
```

Change permission settings:

``` bash
chmod u+rwx patients.txt
chmod g+w patients.txt
chmod g-w patients.txt
```

## Presentation 3: Working with Files and Directories

1.  View the content of a file with different commands. Use a readme
    file from a github repo as an example.

``` bash
cat patients.txt

less
head -n
tail -n
```

2.  Show how commands above can be used to copy content or part of it to
    a new file.

``` bash
head -10 patients.txt > patients_small.txt
```

3.  Show editors: `nano, vim and emacs`. Edit a `readme` file made under
    the project structure. Add a line of text with each editor and show
    and option or two. Save the changes quit and use less to view it.

4.  Show different command for compressing and decompressing a file,
    i.e:

``` bash
# zip 
gzip -k patients.txt
zip patients.zip patients.txt


# unzip
gunzip patients.gz
unzip patients.zip
```

5.  creating a tar archive

``` bash
cd Examples
tar -cvf docs.tar docs
ls #show the tar ball has appeared
mv docs.tar ../ #move it one up
tar -tf docs.tar #show content of the archive but don't untar it
tar -xvf docs.tar #now untar
ls #show the docs dir and its files have appeared in the Just-Bash-It dir
```

## Presentation 4: More Bash Commands - Part 1: wc, sed & cut

1.  Show word count (`wc`), lines and characters:

``` bash
wc -l patients.txt
wc -c patients.txt
wc -w patients.txt
```

Why does `wc -l patients.txt` and `wc -w patients.txt` result in the
same output?

2.  Show some options for `cut`:

Cut bytes and characters

``` bash
cut -b 1,2,3,4 patients.txt
cut -b 1-4 patients.txt
cut -c 1-4 patients.txt
```

Cut field (f) with specified delimiter (d):

``` bash
cut -d ',' -f 1 patients.txt
cut -d ',' -f 3 patients.txt
cut -d ',' -f 2-3,5 patients.txt
```

3.  Show some options for `sed`:

Print lines 12,18 or print everything except lines 12,18:

``` bash
sed -n '12,18p' patients.txt
sed '12,18d' patients.txt
```

Search replace with `sed`:

``` bash
sed 's/herlev/Herlev/g' patients.txt
sed 's/A/X/g' patients.txt

# Only if nothing follows a, regex
sed's/a$/X/g' patients.txt

# Except in line 4
sed '4!s/A/C/g' patients.txt

# Only print lines containing Herlev
sed -n '/Herlev/p' patients.txt

# only replace A with C for lines containing Herlev
sed '/Herlev/s/A/C/g' patients.txt
```

## Presentation 4: More Bash Commands - Part 1: sort, grep & awk

4.  Show some options for `sort`:

``` bash
sort patients.txt

# Sort on field 4
sort -t ',' -k4 patients.txt

# Sort by field 2, than 3
sort -t ',' -k2,3 patients.txt

# Sort numerical 
sort -t ',' -n -k4 patients.txt
sort -t ',' -n -k2 patients.txt
```

5.  Show some options for `grep`

``` bash
# grep pattern, print the line,  i.e. all fields
grep 'Rigshospitalet' patients.txt
grep 'Rigs' patients.txt

# grep count
grep -c 'Rigs' patients.txt

# grep return pattern only
grep -o 'Rigs' patients.txt

# case sensitive
grep 'her' patients.txt
grep -i 'her' patients.txt


# regular expression
grep '40' patients.txt
grep '^40' patients.txt


# more complex regular expression
grep '[0-9]*,[0-9]*,5' patients.txt

# more complex regular expression
grep 'A,[A-Za-z]*,[0-9]*,[0-9]*,5' patients.txt
```

6.  Show some options for `awk`

``` bash
# awk pattern, print the line,  i.e. all fields
awk '/Rigs/ {print}' patients.txt
awk '/[0-9]*,[0-9]*,5/ {print}' patients.txt

# Print by field
awk '/Rigs/ {print}' patients.txt
awk -F ',' '{print $2,$3}' patients.txt

# Print by field more complex
awk -F ',' '/Rigs/ {print $2,$3}' patients.txt
# With delimiter
awk -F ',' '/Rigs/ {print $3 ";" $5}' patients.txt

# With delimiter for all columns
awk -F "," 'OFS=";" {print $3, $4, $2}' patients.txt

# Conditional statement with awk
awk  -F "," '{if ($4 >15) {print $4}}' patients.txt
awk  -F "," '{if ($4 >15) {print}}' patients.txt
```

## Presentation 5: Redirection & Pipes

1.  Chain the commands `sed` and `wc`. `sed` is used to remove the
    header line:

``` bash
sed '1d' patients.txt | wc -l
```

2.  Chain the commands `cut`, `sort` and `uniq` to obtain unique values
    from the hospital column.

``` bash
cut -d ',' -f 3 patients.txt | sort | uniq
```

Same command but remove the header row first with `sed`.

``` bash
sed '1d' patients.txt | cut -d ',' -f 3 | sort | uniq 
```

3.  Chain the commands `awk` and `sort`.

``` bash
awk -F ',' 'OFS="\t" {print $4, $2, $3}' patients.txt | sort  -k1n -k3
```

4.  Chain the commands `awk` and `cat` and show how the dash `-` is used
    to specify input file again.

``` bash
awk -F ',' '{print $5, $2, $3}' patients.txt | cat file1.txt -
awk -F ',' '{print $5, $2, $3}' patients.txt | cat - file1.txt
```

## Presentation 6: Shell Scripts and Loops

0.  Tell that file names are a convention that tells the system and user
    what kind of format to expect, but they do not carry supernatural
    wisdom. Whether a file with data is named .txt, .dat or .csv does
    not change the way we interact with it via the command line.

1.  Show the commands on slide 58 one by one. Ask participants what each
    of them does.

``` bash
cut -f 3 -d ',' patients.dat | sort | uniq -c
head -n 1 patients.dat > herlev.dat
grep 'Herlev' patients.dat | sort -n -k 5 -t ',' >> herlev.dat
```

2.  Fix the spelling mistake where ‘herlev’ is written with a small H.

3.  Re-run the string of commands and display the resulting file
    `herlev.dat`.

``` bash
cut -f 3 -d ',' patients.dat | sort | uniq -c
head -n 1 patients.dat > herlev.dat
grep 'Herlev' patients.dat | sort -n -k 5 -t ',' >> herlev.dat
```

4.  Slide 60: Create the `sort_this.sh` script and show how it works.
    Pass some different files to it.

5.  Slide 60: Create `cut_col.sh` and show how it works.

6.  Create a short script that implements the loop shown in slide 61:

``` bash
for file in *.txt
do
  echo $file
  wc $file
done  
```

## Presentation 7: Software Installation, Upkeep & More

1.  Show activity monitor, task manager & top/htop/ps aux command.

``` bash
man top
# man htop
ps aux
```

2.  Show how to use either `brew` or `apt-get` to update a software,
    could be python or similar. N.B something that does not take
    forever.

3.  Use open to open a file (docx or similar) and an application
    (Browser)

4.  Show hidden configuration files, both those which should not /
    cannot be edited without sudo rights and those which are local and
    can be edited.

5.  Change the command line prompt by editing the approprite
    configuration file (either the .bashrc or the .zshrc).
