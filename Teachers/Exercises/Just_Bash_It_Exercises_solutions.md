![](BashFigure1.jpeg)
================
Center for Health Data Science, November 2023

- <a href="#what-is-this-document" id="toc-what-is-this-document">What is
  this document?</a>
- <a href="#exercise-1-navigating-files-and-directories"
  id="toc-exercise-1-navigating-files-and-directories">Exercise 1:
  Navigating Files and Directories</a>
- <a href="#exercise-2-file-operations-mv-cp-and-rm"
  id="toc-exercise-2-file-operations-mv-cp-and-rm">Exercise 2: File
  operations mv, cp and rm</a>
- <a href="#exercise-3-project-organization"
  id="toc-exercise-3-project-organization">Exercise 3: Project
  Organization</a>
- <a href="#exercise-4-viewing-and-editing-files"
  id="toc-exercise-4-viewing-and-editing-files">Exercise 4: Viewing and
  editing files</a>
- <a href="#exercise-5-data-wrangling-1"
  id="toc-exercise-5-data-wrangling-1">Exercise 5: Data Wrangling 1</a>
- <a href="#exercise-6-data-wrangling-2"
  id="toc-exercise-6-data-wrangling-2">Exercise 6: Data Wrangling 2</a>
- <a href="#exercise-7-redirection--pipes"
  id="toc-exercise-7-redirection--pipes">Exercise 7: Redirection &amp;
  Pipes</a>
- <a href="#exercise-8-part-1-shell-scripts"
  id="toc-exercise-8-part-1-shell-scripts">Exercise 8: Part 1: Shell
  Scripts</a>
- <a href="#exercise-8-part-2-loops"
  id="toc-exercise-8-part-2-loops">Exercise 8: Part 2: Loops</a>

------------------------------------------------------------------------

## What is this document?

We show here partial solutions to the exercises. We have omitted to show
solutions for viewing, moving and creating files as this depends on what
your current working directory is, as well as the folder structure you
build in the second exercise.

Also consult the presentations markdown to see the commands we have
shown during the course.

 

## Exercise 1: Navigating Files and Directories

2.  Listing Files

List with latest updated file shown on top:

``` bash
ls -lt
```

List with largest file shown on top:

``` bash
ls -lhS
```

List hidden files:

``` bash
ls -a
```

The presentations markdown shows some more options to `ls`. For other
tasks we refer to the slideshow.

## Exercise 2: File operations mv, cp and rm

4.  Remove the whole `TEMP` directory including the file within it.

``` bash
rm -r TEMP
```

For other tasks we refer to the slideshow.

 

## Exercise 3: Project Organization

1.  Make a structured `projects` directory. Really depends on your setup
    but will involve a lot of `mkdir` and possible `mkdir -p` if you
    want to create top and sub directories in one go.

2.  How large (in bytes and disk space) are the data files you moved
    from the course materials? Size in bytes:

``` bash
ls -lh
```

Size in disk space:

``` bash
du -h *
```

4.  Check the permissions

``` bash
ls -l
```

5.  Make `Readme` file

``` bash
touch Readme.txt
```

 

## Exercise 4: Viewing and editing files

3.  Expand the `GCF_genomicAnnotation.gff.gz` annotation file while
    making sure you keep a copy of the compressed version.

``` bash
gunzip -k GCF_genomicAnnotation.gff.gz
```

5.  Get the head of `Annotation.gff` and save it to a new file.

``` bash
head GCF_genomicAnnotation.gff > gcf_head.txt
```

7.  Look at the content of one of the two `fq.gz` files with RNA
    sequencing read without expanding the file

``` bash
zless SRR4420293_R2.fastq.gz
```

Press `q` to leave `zless`.

 

## Exercise 5: Data Wrangling 1

1.  Figure out how many, lines, words and characters the
    `Annotation.gff` file contains using `wc`.

``` bash
wc Annotation.gff
```

2.  As we are not interested in the header lines, denoted by hastages,
    remove these from the `Annotation.gff`and name the new file
    `Annotation_tmp.gff`. To do this you can employ the command `sed`,
    see ***pseudo code*** below. You will need to figure out the line
    numbers of the first line and last line to remove. What do you think
    the `d` refers to?

``` bash
sed '1,8d' Annotation.gff > Annotation_tmp.gff
```

3.  Use the command `cut` to make a new file which contains only
    `fields 3,4,5` (i.e. columns with region, start and end) from the
    `Annotation_tmp.gff` and name it whatever you’d like. To do this you
    need to set the *tab* delimiter `'\t'`.  
    Check that the file looks correct.

``` bash
cut -d$'\t' -f 3-5 Annotation_tmp.gff > cols345
```

We also would like to have the gene names. They are in field 7 in the
`Annotation_tmp.gff`, but field 7 contains itself several entries ids,
gene name, locus, tags etc. separated by a `;`. We refer to such
separating characters as `delimiters`. One could say that field 7
contains sub-fields delimited by `;`.

4.  We want to get the sub field starting with `gene=`, this is the gene
    name. To extract this information we will use cut twice. First, we
    will cut out column 7 from `Annotation_tmp.gff` and name that
    temporary file something. Then, we cut the temporary file to get
    field 5

``` bash
cut -d$'\t' -f 7 Annotation_tmp.gff > col7.tmp
cut -d ';' -f 5 col7.tmp > gene_names
```

5.  We would like to remove the repetitive `gene=` in each line to just
    obtain the clean **gene name**. One way to get this is to do a
    search and replace with `sed`. The syntax is shown as ***pseudo
    code*** below. The `sed` command requires you to specify what
    pattern to match `[pattern to match]` and what pattern to replace it
    with `[Replace with]`. The patterns are separated by slashes and the
    whole expression is encased in quotes `'`.

``` bash
sed 's/gene=//g' gene_names > gene_names_clean
```

 

## Exercise 6: Data Wrangling 2

1.  Pasting files together.

``` bash
paste -d '\t' cols.tmp gene_names_clean > Annotation_Gene.gff
```

3.  Let’s have a look at the content of your final file.

- Are there any gene sequences with length 0 in the annotation file?

``` bash
sort -t$'\t' -k 5 -n Annotation_Gene_Len.gff > short_first
head short_first #look at the resulting sorted file
```

- What is the name of the gene with the longest sequence, annotated in
  your file? - Try the command `sort` with flags `-k 5 -nr`

``` bash
sort -t$'\t' -k 5 -nr Annotation_Gene_Len.gff > long_first
head long_first #look at the resulting sorted file
```

- Does our organism of study, Arabidopsis Thaliana, have the `TERT`
  gene? - Try the command `grep`.

``` bash
grep 'TERT' Annotation_Gene_Len.gff
```

- All living organisms have polymerase genes, including Arabidopsis
  Thaliana. How many types of `POL` genes are annotated?

``` bash
grep 'POL' Annotation_Gene_Len.gff
```

- How many gene annotation lines in the file pertain to transfer RNA
  (`tRNA`)? - Try the command `grep` with flag `-c`.

``` bash
grep 'tRNA' Annotation_Gene_Len.gff -c
```

4.  Adding the header

``` bash
#create the header with nano or other editor
cat header.gff Annotation_Gene_Len.gff > Annotation_21Nov2022.gff
mv Annotation_21Nov2022.gff ../Results
```

 

## Exercise 7: Redirection & Pipes

2.  Find the types of genomic features.

``` bash
sed '1,8d' Annotation.gff | cut -f 3 -d$'\t' | sort | uniq
```

3.  Re-run the command line you used above, but this time redirect the
    output directly to the `Data/Generated` directory by specifying the
    path and the name you would like the output file to have. Check the
    `Data/Generated` directory to check that you have correctly made the
    file.

``` bash
sed '1,8d' Annotation.gff | cut -f 3 -d$'\t' | sort | uniq > ../Data/Generated/feature_types.txt
```

4.  Using a single command line, figure out the gene name of the
    microRNA (miRNA) gene which has the smallest genomic starting
    coordinate.

``` bash
grep 'MIR' Annotation.gff | sort -k 4 -n -t$'\t'| cut -f 7 -d$'\t' | cut -f 5 -d ';' | head
```

The microRNA (miRNA) gene which has the smallest genomic starting
coordinate is `gene=MIR5642b` starting at `2805`. You can see the
coordinate by omitting the two cut statements so you see the full line.

5.  View the last 20 commands from your history. You need tail to look
    at the end of the file. The first command would be at the top.

``` bash
history | tail -n 20
```

6.  You will now redo **points 2-6 from Exercise 4 (parts 1 & 2)
    above**. You should end up with a file containing the 4 columns:
    `Region, Start, End and GeneName (only)`. To archive this, chain
    together commands from points 2-6.

Assuming your starting file is `GCF_genomicAnnotation.gff.gz` unzipped
into `Annotation.gff` this works:

``` bash
cut -d$'\t' -f 7 Annotation.gff | cut -d ';' -f 5 | sed 's/gene=/''/g' > geneName.gff 
cut -f 3-5 Annotation.gff | paste -d '\t' - geneName.gff | sed '1,8d' | sed 's/gene=//g' >  output.gff  
```

The solution proposed here is not the only valid solution, merely an
example. If you have a different solution that works that’s fine too.

 

### here

## Exercise 8: Part 1: Shell Scripts

A working script could look like this:

``` bash

#assuming your project folder is 'my_project'  and the unzipped gff should be in the scratch folder
gunzip $1 > ~/my_project/Scratch/unzipped.gff

#change into the scratch folder. We will produce all our temporary files here
cd ~/my_project/Scratch/

cut -d$'\t' -f 7 unzipped.gff | cut -d ';' -f 5 | sed 's/gene=/''/g' > geneName.gff 
cut -f 3-5 unzipped.gff | paste -d '\t' - geneName.gff | sed '1,8d' | sed 's/gene=//g' > ../Data/Generated/output.gff

rm geneName.gff
rm unzipped.gff
```

To run it

``` bash
bash -x ex8.sh ~/my_project/Data/ecoli.gff.gz
```

## Exercise 8: Part 2: Loops

1.  Make a short script with a for loop that does the following:

- go to the data folder
- for each zipped file, i.e. each file ending with .gz:
- display the file name
- display the first 10 lines without unzipping the entire file.

``` bash
cd Data
for file in *.gz
do
  echo $file
  gunzip -k $file | head
done
```
