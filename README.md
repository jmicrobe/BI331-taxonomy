# Culture-independent methods for studying microbial communities

**This repository contains material needed to complete the BI331 taxonomy assignment. It is separated into three sections as markdown (.md) files:**

* [README.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/README.md): The current file, contains background information on the study of microbial ecology and the specific data that we will be analyzing.
* [ANALYSIS.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/ANALYSIS.md): Tutorial for processing and analyzing the given data.
<<<<<<< HEAD
* [ASSIGNMENT.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/ASSIGNMENT.md): Questions to help frame your understanding of microbial ecology and the bioinformatics exercise, as well as suggestions for altering the R script to gain more practice with the material.
* [LINKS.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/LINKS.md): Optional extra links you may find helpful for learning more about microbial ecology, as well as tutorials and learning material for bionformatics.
=======
* [ASSIGNMENT.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/ASSIGNMENT.md): Instructions for interpreting your results and suggestions for modifying/enhancing the provided R script.
* [LINKS.md](https://github.com/jmicrobe/BI331-taxonomy/blob/master/LINKS.md): Optional extra links you may find helpful.
>>>>>>> b886c750a4d1dd3e0673aa586ecd1f8c938d270e

## Learning goals

Students will learn how DNA sequenced-based, culture-independent techniques are used to study microbial communities. Students will formulate hypotheses and test them using bioinformatic and statistical tools to compare microbial communities.

## Table of Contents  

* [Microbial ecology](#microbial-ecology)
* [What is bioinformatics?](#what-is-bioinformatics)
* [Why use DNA sequencing to study microbes?](#why-use-dna-sequencing-to-study-microbes)
* [Assignment data background](#assignment-data-background)
* [Assignment overview](#assignment-overview)
* [Acknowledgments](#acknowledgments)
* [References](#references)

## Microbial ecology
What is a microbial community?
<<<<<<< HEAD
Ecological communities are associations of species that co-occur in the same location at the same time. Microbial community ecology is a field of scientific study focused on the biotic and abiotic factors that determine how populations of microorganisms associate to form communities, how communities interact with each other, and how communities interact with the environment [<sup>1</sup>](#references).
=======
Ecological communities are associations of species that co-occur in the same location at the same time. Microbial community ecology is a field of scientific study focused on the biotic and abiotic factors that determine how populations of microorganisms associate to form communities, how communities interact with each other, and how communities interact with the environment [<sup>1</sup>)](#references).
>>>>>>> b886c750a4d1dd3e0673aa586ecd1f8c938d270e

## What is bioinformatics?
Bioinformatics is a field of science that combines aspects of biology, computer science, and information technology to analyze biological information using computers and statistical techniques. The primary goal of bioinformatics is to develop software tools to generate useful biological knowledge. In microbial ecology, bioinformatic tools are typically used to analyze DNA sequence data. These data can include sequences from cultured organisms or sequences from communities. The latter is discussed in more detail below.

## Why use DNA sequencing to study microbes?
Greater than 99% of the microbes found in nature cannot be cultured and studied in the laboratory. Techniques have been rapidly advancing in recent years making it possible to study microbes and their communities in news ways without the need for culturing. To study these “unculturable” organisms, scientists study their DNA (and sometimes RNA). They collect a sample like a gram of soil or a liter of seawater and extract all the DNA in that sample. Most commonly, a specific gene in that DNA, the 16S rRNA gene, is amplified using polymerase chain reaction (PCR). This produces many copies of all the 16S rRNA genes present in the sample. The 16S genes are sequenced using “high-throughput” DNA sequencing technology that generates thousands (and sometime up to millions) of 16S gene sequences present in every sample. From these 16S gene sequences, we can learn which microbes are present in the sample and their relative abundance.

The 16S rRNA gene is one gene of choice for studying microbial communities for three primary reasons. First, all bacteria have at least one copy of the gene in their genome. Second, there are regions of the gene sequence that are highly variable (which allows us to distinguish among closely related bacteria) and other regions that are more conserved (which allows us to compare among more distantly related groups). Third, it is phylogenetically conserved. This means that closely related bacteria have more similar 16S rRNA gene sequences than do distantly related bacteria.

## Assignment data background
### Study data

For this exercise you will be analyzing 16S rRNA gene sequences from human gut samples. The samples were collected from children in Europe (14 samples) and a rural African village in Burkina Faso (14 samples).

### The human gut microbiome

Microorganisms in the human gastrointestinal tract (GI) perform functions and produce compounds essential for our health. They break down complex molecules (e.g. complex polysaccharides) from the food we eat making them easier for our cells to digest. They produce essential vitamins (e.g. B12 and K) and amino acids, which are absorbed by cells in the gut and then used throughout the body [<sup>1</sup>](#references). This community of microorganisms inhabiting our gut is known as the human gut microbiome.

The composition and function of the gut microbiome varies among individuals and populations. Factors such as ethnicity, diet (e.g. diets rich in protein versus diets rich in complex carbohydrates), and genetics are known to contribute to the variation we see in the human gut microbiome [<sup>2</sup>](#references). Variation in the composition of these microbial communities also leads to variation in their function. One interesting example of this is a study that compared the gut microbiome of Japanese and American populations [<sup>3</sup>](#references). Researchers found a high abundance of bacteria carrying a specific gene in Japanese populations compared to American populations. This gene helps the microbes break down complex carbohydrates found in the seaweed used to make nori, one the main ingredients in sushi and a common ingredient in other Japanese cuisine. Because seaweed is a larger part of the diet in Japanese populations compared to American populations, the guts of Japanese populations harbor this seaweed-digesting bacterium, which helps them get the most energy possible from their food.  (There’s another interesting level to this story.  The gut bacteria that carry this gene actually acquired it though horizontal gene transfer from marine bacteria that colonize the seaweed in the ocean!). This is just one of many examples of how diet can affect the composition and function of gut microbial communities.

## Assignment overview

You will perform two analyses using tools developed by the Ribosomal Database Project [<sup>4</sup>](#references). In the first, you will assign taxonomic classifications to the 16S rRNA gene sequences in the data set you will be provided using the Naïve Bayesian Classifier. This tool classifies the sequences in your data by comparing them to 16S rRNA gene sequences from well-characterized bacterial species using an algorithm based on Bayesian probability. The Naïve Bayesian Classifier generates a hierarchical classification (Domain, Phylum, Class Order, Family, Genus, and Species) for each 16S gene sequence in your data.  

For the second analysis, you will statistically compare the composition of two communities (BF versus EU). The Library Compare Tool tests for significant differences between the two communities in the relative abundances of taxonomic groups. It uses Bayesian probability to estimate the likelihood that the relative abundance of a given taxonomic group is the same for the two communities. The output from this analysis includes taxonomic groups for which the relative abundance is significantly different, and the significance value of the difference. The significance value can be thought of as the likelihood that the difference is due to chance. The lower the significance value, the more confident we can be that the difference in relative abundance reflects real differences in how the communities are structured.

## Acknowledgments
This exercise was originally written and graciously provided  by Dr. Ann Klein in the Institute of Ecology and Evolution at the University of Oregon. It has been updated and modified using new analysis techniques by Jessica Hardwicke of the Masters of Bioinformatics program at UO.  

## References
1.	Madigan, Michael T., et al. "Biology of Microorganisms." (2012).
2.	Yatsunenko, Tanya, et al. "Human gut microbiome viewed across age and geography." Nature 486.7402 (2012): 222-227.
3.	Hehemann, Jan-Hendrik, et al. "Transfer of carbohydrate-active enzymes from marine bacteria to Japanese gut microbiota." Nature (2010): 908-912.
4.	Cole, J. R., et al. "The Ribosomal Database Project: improved alignments and new tools for rRNA analysis." Nucleic Acids Research (2009): D141-D145.
