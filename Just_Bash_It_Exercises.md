![](BashFigure1.jpeg)
================
Center for Health Data Science, July 2022

- <a href="#introduction" id="toc-introduction">Introduction</a>
- <a href="#a-note-on-pseudo-code" id="toc-a-note-on-pseudo-code">A note
  on pseudo code</a>
- <a href="#exercise-1-navigating-files-and-directories"
  id="toc-exercise-1-navigating-files-and-directories">Exercise 1:
  Navigating Files and Directories</a>
- <a href="#exercise-2-project-organization"
  id="toc-exercise-2-project-organization">Exercise 2: Project
  Organization</a>
- <a href="#exercise-3-working-with-files"
  id="toc-exercise-3-working-with-files">Exercise 3: Working with
  Files</a>
- <a href="#exercise-4-more-bash-commands---part-1-wc-sed--cut"
  id="toc-exercise-4-more-bash-commands---part-1-wc-sed--cut">Exercise 4:
  More Bash Commands - Part 1: wc, sed &amp; cut</a>
- <a href="#exercise-4-more-bash-commands---part-2-sort-paste-awk--grep"
  id="toc-exercise-4-more-bash-commands---part-2-sort-paste-awk--grep">Exercise
  4: More Bash Commands - Part 2: sort, paste, awk &amp; grep</a>
- <a href="#exercise-5-redirection--pipes"
  id="toc-exercise-5-redirection--pipes">Exercise 5: Redirection &amp;
  Pipes</a>
- <a href="#exercise-6-part-1-shell-scripts"
  id="toc-exercise-6-part-1-shell-scripts">Exercise 6: Part 1: Shell
  Scripts</a>
- <a href="#exercise-6-part-2-loops"
  id="toc-exercise-6-part-2-loops">Exercise 6: Part 2: Loops</a>
- <a href="#exercise-7-software-installation-upkeep--more"
  id="toc-exercise-7-software-installation-upkeep--more">Exercise 7:
  Software Installation, Upkeep &amp; More</a>

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

 

## A note on pseudo code

Some exercises and explanations in this document contain what is called
‘pseudo code’. Pseudo code is an abstracted way to write an idea of
code. It will not necessarily run when executed, so **do not copy**
pseudo code straight into the command line. Rather it explains the idea
of how your code should be structured. We will explicitly let you know
when a snippet is ***pseudo code***.

Pseudo code can look like this:

``` bash
wc [your file]
```

In the above example square bracets mean you need to **replace** what is
between them with the actual file, expression, ect you want to use. The
square bracets themselves are not part of the code. For example, if you
wanted to word count the readme file, you would replace `[your file]`
with `README.md`:

``` bash
wc README.md
```

## Exercise 1: Navigating Files and Directories

On your command line, go to where you have downloaded the course
materials. If the directory is zipped, unzip it. (This might be easier
to do with the graphical user interface).

1.  List the files and directories in the top directory `Just-Bash-It`.
    Which file was last updated? Which file is the largest?

2.  Go to the `Examples` directory and list its contents.

3.  Move the text file `mytextfile.txt` from the `images` folder to the
    `docs` folder. Confirm that is is in the right place.

4.  Make a copy of the `mytextfile.txt` file (now in `docs`) and rename
    the copy to whatever you’d like.

5.  Move to the `Examples` directory and make a new folder here called
    `TEMP`. Now move your copied file from point 4. above to the `TEMP`
    folder.

6.  Remove the whole `TEMP` directory including the file within it. Do
    you run into any problems with trying to do this?  
    You need a flag to remove a whole folder, try the manual help for
    the remove command `man rm` to figure out what flag this is.

 

## Exercise 2: Project Organization

Let’s get structured!

1.  Make a `projects` directory at `/home/user/Desktop` on your computer
    with all the sub-directories shown on **slide 30** in the slideshow.
    You are free to name the project within the `projects` directory
    whatever you would like, e.g. **Just_Bash_It, Intro_to_command_line,
    First_Project, etc.**.  
    **Cheat Sheet 1** in the slideshow will have the commands you need.

You should have downloaded the course materials including the raw data
files to you computer, maybe it is in your downloads directory or
perhaps you moved it somewhere else.

2.  Using the command-line, navigate to where you downloaded the course
    materials an go to the directory named `Data`, here you should see
    three files, all with the extension `.gz`. Move these three files to
    the project directory you have made and place them in the correct
    sub-directory.

3.  How large are the data files you moved from the course materials?

4.  Check the permissions of the data files from the course materials.
    Do you have permission to `read`, `write` and `execute` them? If you
    are not allowed to execute the, what is the reason for this?

5.  Make a new file called `Readme` within your project directory. heck
    the permissions of the file you just made and modify the permission
    of this file so the ‘group’ can write to the file (HINT:`chmod`).

 

## Exercise 3: Working with Files

1.  Go to your project directory and edit the `readme` file you made in
    **Exercise 2** using the one of the editors `nano`, `vim or vi`,
    `emacs`. **N.B** you might only have one of them installed!  
    A `readme` file should contain information about what a certain
    directory contains, its purpose and who owns it/is the editor.

2.  Move to the sub-directory `Data/Raw` here you should have the three
    data files you moved from the course material directory.

Two of these files are `fastq` files, they contain RNAseq reads from a
bulk-RNA sequencing experiment using Arabidopsis thaliana (thale cress).
The extension `_R1` and `_R2` denote that reads are paired-end
(e.g. read 1 and read 2). The third file with the extension `.gff`,
contains annotations of genes and other genomic feature from the
organism of study, Arabidopsis Thaliana.

3.  Expand the `GCF_genomicAnnotation.gff.gz` annotation file while
    making sure you keep a copy of the compressed version.  
    **HINT:** look into what flags/arguments need to be specified when
    decompressing).

4.  Try out the commands `less, cat, head, tail` on the expanded `.gff`
    file.

The file contains the fields (columns) shown below, and includes
information on; annotation source, region, sequence start and end
position, stand, as well as a column containing various information on
the sequences, i.e. entry id, gene name, locus, ids, tags etc.

| NC ID       | Source | Region | Start | End  | Strand | Gene transcript etc. |
|-------------|:------:|:------:|:-----:|:----:|:------:|---------------------:|
| NC_003070.9 | RefSeq |  exon  | 4706  | 5095 |   \+   |  gene=ARV1;locus_tag |

Note how that the file header (first part of the file) is denoted by
hastags.

5.  Rename the expanded `.gff` to `Annotation.gff`. Move the
    `Annotation.gff` to your `Scratch` directory.

6.  Look at the content of one of the two `fq.gz` files with RNA
    sequencing read, **N.B.** this time without expanding the file! How
    many lines are annotated for each read?

 

## Exercise 4: More Bash Commands - Part 1: wc, sed & cut

You will now test out some of the new commands introduced in the slide
show and the command line presentation.

Go to your directory `Scratch` where you should have a copy of the
unzipped `GCF_genomicAnnotation.gff.gz` file named `Annotation.gff`,
which you made in exercise 3.5 above. For inspiration on how to solve
the questions below have a look at **slide 46**.  
**N.B** Remember if you are not sure what arguments (flags) a given
command has you can always use `man [name_of_command]`to see what flags
(arguments) a command takes.

1.  Figure out how many, lines, words and characters the
    `Annotation.gff` file contains using `wc`.

2.  As we are not interested in the header lines, denoted by hastages,
    remove these from the `Annotation.gff`and name the new file
    `Annotation_tmp.gff`. To do this you can employ the command `sed`,
    see ***pseudo code*** below. You will need to figure out the line
    numbers of the first line and last line to remove. What do you think
    the `d` refers to?

``` bash
sed '[number first line],[number last line]d' Annotation.gff > Annotation_tmp.gff
```

Have a look at the `Annotation_tmp.gff`. Does it look correct now,
i.e. no headers with hastags? And does it have number of lines you
expect it to have?

3.  Use the command `cut` to make a new file which contains only
    `fields 3,4,5` (i.e. columns with region, start and end) from the
    `Annotation_tmp.gff` and name it whatever you’d like. Check that the
    file looks correct.

We also would like to have the gene names. They are in field 7 in the
`Annotation_tmp.gff`, but field 7 contains itself several entries ids,
gene name, locus, tags etc. separated by a `;`. We refer to such
separating characters as `delimiters`. One could say that field 7
contains sub-fields delimited by `;`.

We want to get the sub field starting with `gene=`, this is the gene
name.To extract this information we will use cut twice. First, we will
cut out column 7 from `Annotation_tmp.gff` and name that temporary file
something. Then, we cut the temporary file to get field 5

The code is provided below. Try to understand what happens in each line.
Particularly:

- What do the flags `-d` and `-f` do?
- Why are we setting the -f flag to 5 not 7 (*HINT: field vs
  sub-field*)?

``` bash
cut -f 7 Annotation_tmp.gff > col7.tmp
cut -d ';' -f 5 col7.tmp > gene_names
```

Check that the file looks correct after extraction, i.e. does it seem to
the the field you are interested in?

5.  We would like to remove the repetitive `gene=` in each line to just
    obtain the clean **gene name**. One way to get this is to do a
    search and replace with `sed`. The syntax is shown as ***pseudo
    code*** below. The `sed` command requires you to specify what
    pattern to match `[pattern to match]` and what pattern to replace it
    with `[Replace with]`. The patterns are separated by slashes and the
    whole expression is encased in quotes `'`.

``` bash
sed 's/[pattern to match]/[Replace with]/g' [input file] > [output file]
```

For the pseudo code chunk figure out:

- What the input file should be?  
- Change `[pattern to match]` to the pattern you want to match and
  `[Replace with]` to what you want to replace with (*HINT: replace with
  empty/nothing*).  
- What does the `s` and `g` denote?  
- Run the command and save the output to whatever file name you’d like.

 

## Exercise 4: More Bash Commands - Part 2: sort, paste, awk & grep

6.  You should now have one file containing only field 3, 4 & 5
    (question 2.) and one containing only the sub-field with gene names
    from field 7 (question 5.).  
    Paste these two files together into a single file using the command
    `paste`, name this file `Annotation_Gene.gff`. You will need to use
    the flag `-d` to specify what kind of delimiter should be used to
    paste the fields together, you should use a tab-delimiter, denoted
    `'\t'`.

7.  Run and decipher the command below.

``` bash
awk -F '\t' 'OFS="\t" {$5=$3-$2}{print}' Annotation_Gene.gff > Annotation_Gene_Len.gff
```

- What is the output of the command?  
- What does the flag `-F` specify?
- What does `OFS="\t"` mean? *HINT: Google this!*
- What is going on inside the curly brackets?

8.  Let’s have a look at the content of your final file.

- Are there any gene sequences with length 0 in the annotation file? -
  Try the command `sort` with flags `-k 5`
- What is the name of the gene with the longest sequence, annotated in
  your file? - Try the command `sort` with flags `-k 5 -nr`  
- Does our organism of study, Arabidopsis Thaliana, have the `TERT`
  gene? - Try the command `grep`.
- All living organisms have polymerase genes, including Arabidopsis
  Thaliana. How many types of `POL` genes are annotated?
- How many gene annotation lines in the file pertain to transfer RNA
  (`tRNA`)? - Try the command `grep` with flag `-c`.

9.  Your new file `Annotation_Gene_Len.gff` does not have any headers on
    each field. Make a new file called `header.gff`, use nano for this,
    copy the content below into the file and close/save it.

``` bash
Region    Start   End   GeneName    Length
```

Now, use the command `cat` to bind `header.gff` and
`Annotation_Gene_Len.gff` together. Name the output
`Annotation_[TodaysDate].gff`

When you have checked at the file looks correct, move the file to your
**Results** directory - **N.B** go to the sub-directory and check that
you have moved it correctly!. You can now remove (delete) all the
temporary files in your `Scratch` directory. WELL DONE!

 

## Exercise 5: Redirection & Pipes

1.  Copy (`cp`) the `GCF_genomicAnnotation.gff` from your `Data/Raw` dir
    to the `Scratch` dir. This is done by specifying the path to where
    the copy should go. Move to the `Scratch` directory.

Lets try some piping (chaining) of commands.

2.  You will chain four commands with pipes (`|`), step by step:  

- Remove the header rows (those beginning with hastages) in the file,
  like you did in point 2, Exercise 4, above  
- Extract (`cut`) the column that contains the annotation **Region**
  (exon, CDS, etc.).  
- Sort the extracted column with `sort`  
- Get the unique elements from this column with the command `uniq`

3.  Re-run the command line you used above, but this time redirect the
    output directly to the `Data/Generated` directory by specifying the
    path and the name you would like the output file to have. Check the
    `Data/Generated` directory to check that you have correctly made the
    file.

4.  Using a single command line, figure out the name of the microRNA
    (miRNA) gene which has the smallest genomic starting coordinate. You
    will need to combine commands `cut`, `sort` and `grep` to archive
    this. **HINT**: miRNA gene names begin with `MIR`.

5.  You will now redo **points 2-6 from Exercise 4 (parts 1 & 2)
    above**. You should end up with a file containing the 4 columns:
    `Region, Start, End and GeneName (only)`. To archive this, chain
    together commands from points 2-6.  
    **N.B:** You do NOT need to do everything in one command line, but
    try to reduce the number of intermediate files to as few as
    possible. It is possible to get the output file in two command lines
    (i.e. only one intermediate file). **HINT:** the commands do not
    need to be combined in the same order as in Exercise 4, in fact,
    they shouldn’t be.

 

## Exercise 6: Part 1: Shell Scripts

We will now save the commands from exercises 4 and 5 in a script so we
don’t lose them and can easily re-run our analysis with a different gff
file.

We will use the `history` command to easily get a record of what we have
done so far.

First, let’s see how much is in your history:

``` bash
history | wc 
```

If you have a lot of commands saved in your history you might only want
to see the last 20 or so. This command will show you the last 20:

``` bash
history | tail -n 20
```

1.  Create a new file, either with the command line or the editor of
    your choice, and name it `ex4.sh`. This is the file which will
    contain your script. A script is just a collection of commands that
    are executed one after another.

2.  Using your `history`, copy the commands you used to solve exercise 4
    into `ex4.sh`. Save it.

3.  Run `ex4.sh` by calling `bash`. Does it run without error? If not,
    correct what is wrong until it does. Check that it creates the
    correct files, i.e. they should look the same as when you manually
    executed the commands.

``` bash
bash ex4.sh
```

4.  Add lines to your script `ex4.sh` that will remove the temporary
    files created. Check that the files are indeed removed, and no other
    files have been deleted by accident. If you did delete something you
    can just re-download the respective file from github.

5.  Now replace the name of the input file,
    `GCF_genomicAnnotation.gff.gz`, with an argument so that you can run
    your script on different input files. Test that this works.

6.  Run your script on `ecoli.gff.gz` by passing the file name as an
    argument.

## Exercise 6: Part 2: Loops

1.  Make a short script with a for loop that does the following:

- go to the data folder
- for each zipped file, i.e. each file ending with .gz:
- display the file name
- display the first 10 lines without unzipping the entire file like you
  did in Exercise 3, question 6.

## Exercise 7: Software Installation, Upkeep & More

In this exercise we will install first a package manager and then use
this package manager to install a software.

1.  Installer:

- **For OS X systems:**  
  Install `Homebrew` (N.B this may take some time), figure out how to do
  it here (is is one-liner in the command line): <https://brew.sh/>
- **For Ubuntu and Linux systems, Windows (WSL) systems & MobaXterm
  users**: You most likely already have `apt-get` installed. Figure out
  what version you have? HINT: `--version`.

Now that you have installed a package manager you will use it to install
a command line tool on your laptop. We will install **FastQC**
(<https://www.bioinformatics.babraham.ac.uk/projects/fastqc/>) which is
a tool for quality control of DNA and RNA sequencing reads.

2.  FastQC:

- **For OS X systems, Ubuntu/Linux systems & Windows (WSL) systems:**  
  If you already have `fastqc` installed, then update it, otherwise
  install using the appropriate install command for your system.  
- **MobaXterm users**:  
  You will need to install `perl` before you can use `fastqc`:
  - Click this link to install `perl` for `MobaXterm`:
    <https://mobaxterm.mobatek.net/plugins/Perl.mxt3>. Put the the
    `perl` plug-in in the same directory as the MobaXterm executable.
  - Download `fastqc` here:
    <https://sourceforge.net/projects/fastqc.mirror/files/latest/download>.
    Put the `fastQC` executable in the same directory as the MobaXterm
    executable.

We will check that `fastqc` is correctly installed and works by running
the tool on our two files (`_R1.fastq` and `_R2.fastq`) containing
sequencing reads.

3.  Move to the `Data/Raw/`. Modify and use the command below to run
    `fastqc`. You should specify the path to the directory you want the
    output to go to, in this case `Data/Generated/`.

Have a look at your output.

Extra: Try using `open` to open a file (xlsx, docx, etc.) and an app
(browser, Rstudio, etc.) via the command line.
