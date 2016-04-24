# Analysis tutorial

This tutorial will work you through the steps needed to complete the assignment. You should not need to install anything if you are using the laptops provided by the lab, but if you choose to do this on your own computer you'll need the following programs:

* [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
* [RDP Tools](https://github.com/rdpstaff/RDPTools)
* [RStudio](https://www.rstudio.com/products/rstudio/download/)

Note that the RDP classifier is also [available online](https://rdp.cme.msu.edu/classifier/classifier.jsp), however the output file may be slightly different from the command-line generated file we will use in class.

Also note that you can use R from command line instead of RStudio, but the latter is totally free and lots of fun so why would you?

## 1. Cloning the class repository to your computer and preview the files
To make things simple we'll be working from the desktop. Open terminal and enter:
```
cd ~/Desktop
```
Now we'll clone the class repository to the laptop, which will copy the files and create a folder in the current directory:

```
git clone https://github.com/jmicrobe/BI331-taxonomy.git
```
Now change to the new directory:
```
cd BI331-taxonomy
```
Now check that all the files are there by using the ls command to list what's in the folder:
```
ls
```
You should see the following:
```
ANALYSIS.md		ASSIGNMENT.md		BF_samples.fasta	EU_samples.fasta	README.md
```
Great job! Now lets peek into the .fasta files. The fasta format is used to contain sequencing data. We'll use the head command to see the first several lines of the file:

```
head BF_samples.fasta
```

Your output should have repeating lines that look something like this:
```
>10BF.397096_4143 F4HTPAO04ECMBR orig_bc=TCAGATCAGACAC new_bc=TCAGATCAGACAC bc_diffs=0
GTCCGCACGGTAAACGATGGATGCCCGCCTGTTGGTCTGAATAGGTCAGCGGCCAAGCGAAAGCATTAAGCATCCCACCTGGGGAGTACGCCGGCAACGGTGAAACTCAAAGGAATTGACGGGGGCCCGCACAAGCGGAGGAACATGTGGTTTAATTCGATGATACGCGAGGAACCTTACCCGGGCTTGAATTGCAGAGGAAGGATTTGGAGACAATGACGCCCTTCGGGGTCGTCTGTGAAGGTG
```
The above represents one entry in the fasta file. In the context of this study this represents one individual sequence of a 16S rRNA gene from the a human fecal sample. How many individual entries do we have in this particular file?

You could count these entries manually, but we're lazy programmers so we can get our computer to do that for us. Note that each entry has two lines: The first line, or header - starts with a `>` followed by what looks to be metadata. The second line is the corresponding nucleotide sequence, `GTCCG...` etc.

With bash (the language you've been using in the terminal) there are many utilities to explore files, including the `ls` and `head` commands we used earlier. Let's try `grep`, which can be used to search a file and return matching queries. Since each entry starts with `>` we'll look for that:

```
grep '>' BF_samples.fasta

```
Whoa! That printed out a bunch of lines, all starting with `>`. What `grep` did was find and return all of header lines in the fasta file and return them as output.

But that still doesn't tell us **how many** entries there are, and we're still too lazy to count them all. We can use the utility `wc` which stands for "word count" and us the option `-l` which will only count the number of lines. But we want to do that on the output of our `grep` search, not the entire file, so we will use a `|` (pipe) to do both at once:

```
grep '>' BF_sampes.fasta | wc -l
```
You should have gotten `1190` as output. This means that in our BF_samples.fasta file there are 1190 entries, or 1190 sequenced 16s rRNA genes.

## 2. Taxonomic classification of sequences

Even though we counted the number of entries in our BF_samples.fasta file to be 1190, that doesn't mean there are 1190 *different* OTUs (see [README]((https://github.com/jmicrobe/BI331-taxonomy/blob/master/README.md)) for a reminder of what an OTU is).



```
java -Xmx1g -jar /path/to/classifier.jar -o BF_classified.txt -h BF_hier.txt BF_samples.fasta
```

```
java -Xmx1g -jar /path/to/classifier.jar libcompare -q1 BF_samples.fasta -q2 EU_samples.fasta -o libcompare.txt
```
