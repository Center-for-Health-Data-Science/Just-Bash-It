![](BashFigure1.jpeg)
================
Center for Health Data Science, July 2022

-   [What is this document?](#what-is-this-document)
-   [Exercise 1: Navigating Files and
    Directories](#exercise-1-navigating-files-and-directories)
-   [Exercise 2: Project Organization](#exercise-2-project-organization)
-   [Exercise 3: Working with Files](#exercise-3-working-with-files)
-   [Exercise 4: More Bash Commands - Part 1: wc, sed &
    cut](#exercise-4-more-bash-commands---part-1-wc-sed--cut)
-   [Exercise 4: More Bash Commands - Part 2: sort, paste, awk &
    grep](#exercise-4-more-bash-commands---part-2-sort-paste-awk--grep)
-   [Exercise 5: Redirection & Pipes](#exercise-5-redirection--pipes)
-   [Exercise 6: Part 1: Shell
    Scripts](#exercise-6-part-1-shell-scripts)
-   [Exercise 6: Part 2: Loops](#exercise-6-part-2-loops)

------------------------------------------------------------------------

## What is this document?

We show here partial solutions to the exercises. We have omitted to show
solutions for viewing, moving and creating files as this depends on what
your current working directory is, as well as the folder structure you
build in the second exercise.

Also consult the presentations markdown to see the commands we have
shown during the course.

 

## Exercise 1: Navigating Files and Directories

1.  List the files and directories in the top directory `Just-Bash-It`.
    List with latest updated file shown on top:

``` bash
ls -t
```

List with largest file shown on top:

``` bash
ls -S
```

Also consult the presentations markdown for more options to `ls`.

2.  Go to the `Examples` directory and list its contents.

``` bash
cd Examples
ls
```

3.  Now, also list the content of its sub directories.

``` bash
ls *
```

4.  Move the `mytextfile.txt` file Depends on which your current working
    directory is. If you are in Examples/images it would be:

``` bash
mv mytextfile.txt ../docs
```

5.  Make a copy of `mytextfile.txt`

``` bash
cp mytextfile.txt new_file.txt
```

6.  Make a new folder called `TEMP`.

``` bash
mkdir TEMP
```

7.  Remove the whole `TEMP` directory including the file within it.

``` bash
rm -r TEMP
```

 

## Exercise 2: Project Organization

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

5.  `Readme` file and change permissions

``` bash
touch Readme.txt
chmod g+w Readme.txt
```

 

## Exercise 3: Working with Files

3.  Expand the `GCF_genomicAnnotation.gff.gz` annotation file while
    making sure you keep a copy of the compressed version.

``` bash
gunzip -k GCF_genomicAnnotation.gff.gz
```

5.  Rename the expanded `.gff` to `Annotation.gff`. Move the
    `Annotation.gff` to your `Scratch` directory.

``` bash
mv GCF_genomicAnnotation.gff Annotation.gff
mv Annotation.gff Scratch
```

6.  Look at the content of one of the two `fq.gz` files with RNA
    sequencing read, **N.B.** this time without expanding the file!

``` bash
zless SRR4420293_R2.fastq.gz
```

Press `q` to leave `zless`.

 

## Exercise 4: More Bash Commands - Part 1: wc, sed & cut

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

 

## Exercise 4: More Bash Commands - Part 2: sort, paste, awk & grep

6.  You should now have one file containing only field 3, 4 & 5
    (question 2.) and one containing only the sub-field with gene names
    from field 7 (question 5.).  
    Paste these two files together into a single file using the command
    `paste`, name this file `Annotation_Gene.gff`. You will need to use
    the flag `-d` to specify what kind of delimiter should be used to
    paste the fields together, you should use a tab-delimiter, denoted
    `'\t'`.

``` bash
paste -d '\t' cols345 gene_names_clean > Annotation_Gene.gff
```

7.  Run and decipher the command below.

``` bash
awk -F '\t' 'OFS="\t" {$5=$3-$2}{print}' Annotation_Gene.gff > Annotation_Gene_Len.gff
```

8.  Let’s have a look at the content of your final file.

-   Are there any gene sequences with length 0 in the annotation file?

``` bash
sort -t$'\t' -k 5 -n Annotation_Gene_Len.gff > short_first
head short_first #look at the resulting sorted file
```

-   What is the name of the gene with the longest sequence, annotated in
    your file? - Try the command `sort` with flags `-k 5 -nr`

``` bash
sort -t$'\t' -k 5 -nr Annotation_Gene_Len.gff > long_first
head long_first #look at the resulting sorted file
```

-   Does our organism of study, Arabidopsis Thaliana, have the `TERT`
    gene? - Try the command `grep`.

``` bash
grep 'TERT' Annotation_Gene_Len.gff
```

-   All living organisms have polymerase genes, including Arabidopsis
    Thaliana. How many types of `POL` genes are annotated?

``` bash
grep 'POL' Annotation_Gene_Len.gff
```

-   How many gene annotation lines in the file pertain to transfer RNA
    (`tRNA`)? - Try the command `grep` with flag `-c`.

``` bash
grep 'tRNA' Annotation_Gene_Len.gff -c
```

9.  Add the header

``` bash
#create the header with nano or other editor
cat header.gff Annotation_Gene_Len.gff > Annotation_21Nov2022.gff
mv Annotation_21Nov2022.gff ../Results
```

 

## Exercise 5: Redirection & Pipes

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

5.  You will now redo **points 2-6 from Exercise 4 (parts 1 & 2)
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

 

## Exercise 6: Part 1: Shell Scripts

3.  Run `ex6.sh` by calling `bash`.

You might need to either change directory or point to the gff file with
the full path since your script is probably not in the same directory as
the file. In fact, it should be in the scripts directory!

4.  Add lines to your script `ex6.sh` that will remove the temporary
    files created.

Add lines to the script that remove all temporary files you create. I.e.
if you make a file called `geneName.gff`, add `rm geneName.gff` to the
end of the script.

5.  Now replace the name of the input file,
    `GCF_genomicAnnotation.gff.gz`, with an argument so that you can run
    your script on different input files. Test that this works.

Replace the input file name with `$1` and supply the name of the file to
run on when you call the script:

``` bash
bash -x ex6.sh Annotation.gff
```

6.  Run your script on `ecoli.gff.gz` by passing the file name as an
    argument.

## Exercise 6: Part 2: Loops

1.  Make a short script with a for loop that does the following:

-   go to the data folder
-   for each zipped file, i.e. each file ending with .gz:
-   display the file name
-   display the first 10 lines without unzipping the entire file.

``` bash
cd Data
for file in *.gz
do
  echo $file
  gunzip -k $file | head
done
```
