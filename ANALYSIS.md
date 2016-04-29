# Analysis

This tutorial will work you through the steps needed to complete the assignment. You should not need to install anything if you are using the laptops provided by the lab, but if you choose to do this on your own computer you'll need the following (totally free) programs:

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [RDP Tools](https://github.com/rdpstaff/RDPTools)
* [RStudio](https://www.rstudio.com/products/rstudio/download/)

Note that the RDP classifier is also [available online](https://rdp.cme.msu.edu/classifier/classifier.jsp), however the output file may be slightly different from the command-line generated file we will use in class.

## Cloning the class repository to your computer and previewing the files
To make things simple we will work from the desktop. Open terminal and enter:
```
cd ~/Desktop
```
Now we need to clone the class repository, which will copy the files from GitHub and create a folder in the current directory:

```
git clone https://github.com/jmicrobe/BI331-taxonomy.git
```
Change to the new directory, using `cd`:
```
cd BI331-taxonomy
```
Check that all the files are there by using the `ls` command to list what's in the folder:
```
ls
```
You should see the following:
```
ANALYSIS.md		BF_samples.fasta	LINKS.md		rscript.R
ASSIGNMENT.md		EU_samples.fasta	README.md		taxonomy_guide.pdf
```
Let's peek into the .fasta files. The fasta format is used to contain sequencing data. We can use the head command to see the first several lines of the file:

```
head BF_samples.fasta
```

Your output should have repeating lines that look something like this:
```
>10BF.397096_4143 F4HTPAO04ECMBR orig_bc=TCAGATCAGACAC new_bc=TCAGATCAGACAC bc_diffs=0
GTCCGCACGGTAAACGATGGATGCCCGCCTGTTGGTCTGAATAGGTCAGCGGCCAAGCGAAAGCATTAAGCATCCCACCTGGGGAGTACGCCGGCAACGGTGAAACTCAAAGGAATTGACGGGGGCCCGCACAAGCGGAGGAACATGTGGTTTAATTCGATGATACGCGAGGAACCTTACCCGGGCTTGAATTGCAGAGGAAGGATTTGGAGACAATGACGCCCTTCGGGGTCGTCTGTGAAGGTG
```
The above represents **one entry** in the fasta file. In the context of this study this represents one individual sequence of a 16S rRNA gene from a human fecal sample. How many individual entries do we have in this particular file?

You could count these entries manually, but we're lazy programmers so want to find a way to make the computer do the work. Note that each entry has two lines: The first line, or header - starts with a `>` followed by what looks to be metadata. The second line is the corresponding nucleotide sequence, `GTCCG...` etc. ([more info on the fasta format](https://en.wikipedia.org/wiki/FASTA_format)).

With bash (the language you've been using in the terminal) there are many utilities to explore files, including the `ls` and `head` commands we used earlier. Let's try `grep`, which can be used to search a file and return matching queries. Since each entry starts with `>` we can look for that:

```
grep '>' BF_samples.fasta
```
Whoa! That printed out a bunch of lines, all starting with `>`. What `grep` did was find and return **all** of the header lines in the fasta file.

But that still doesn't tell us **how many** entries there are, and we're still too lazy to count them all. We can use the utility `wc` which stands for "word count" and the option `-l` which will only count the number of lines. But we want to do that on the output of our `grep` search, not the entire file, so we will use a `|` (pipe) to do both at once:

```
grep '>' BF_sampes.fasta | wc -l
```
You should have gotten `1190` as output. This means that in our BF_samples.fasta file there are 1190 entries, or 1190 16s rRNA sequences.

## Taxonomic classification of sequences

Even though we counted the number of entries in our BF_samples.fasta file to be 1190, that doesn't mean there are 1190 *different* species in our sample. As mentioned in the [README.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/README.md), we can use the RDPTools classifier to assign taxonomy information to our sequences.

Enter the following command in terminal, noting that `/path/to/classifier.jar` will need to be changed depending on the location of `classifier.jar` on your computer.

```
java -Xmx1g -jar /path/to/classifier.jar -o BF_classified.txt -h BF_hier.txt BF_samples.fasta
```

We also want to use RDP's libcompare tool in order compare to test for significant differences between our two samples. The following command will create the file "libcompare.txt" that we can use for this analysis. Again, note that you will need to enter the correct path to your classifier.
```
java -Xmx1g -jar /path/to/classifier.jar libcompare -q1 BF_samples.fasta -q2 EU_samples.fasta -o libcompare.txt
```

## Statistical analyses in RStudio
In steps 1 and 2 we utilized bash to clone the class repository, preview our files, and run commands for the RDP Tools program. If you'd like to learn more about bash there is a great tutorial [**here**](http://swcarpentry.github.io/shell-novice/) provided by [Software Carpentry](http://software-carpentry.org/) that is geared towards scientists. More helpful links can be found at [LINKS.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/LINKS.md).

At this point we'll use a different language called R, which was developed for statistical computing and graphics. Many of these things can (and used to) be performed in Excel but R provides a more robust approach, and the program RStudio provides a relatively easy to use graphical interface.

For the rest of this tutorial you'll want to open the file rscript.R in RStudio on your computer. The code is provided for you, with comments explaining each step. During class we'll go over some basics of R and RStudio, and how to run the analysis script provided.
