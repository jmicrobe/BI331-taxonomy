# Culture-independent methods for studying microbial communities

##### Table of Contents  
[Learning goals](#headers)  
[Methods background](#emphasis)   
[What is bioinformatics?](#headers)   
[Why use DNA sequencing to study microbes?](#headers)    
[Study background](#headers)  
[Hypotheses](#headers)  
[Part 1: Taxonomic classification using RDP](#headers)  
[Part 2: Statistical community comparison using R](#headers)  
[Results & Interpretation](#headers)  
<a name="headers"/>

## Learning goals
Students will learn how DNA sequenced-based, culture-independent techniques are used to study microbial communities. Students will formulate hypotheses and test them using bioinformatic and statistical tools to compare microbial communities. 

## Methods background
What is a microbial community?
Ecological communities are associations of species that co-occur in the same location at the same time. Microbial community ecology is a field of scientific study focused on the biotic and abiotic factors that determine how populations of microorganisms associate to form communities, how communities interact with each other, and how communities interact with the environment (1).

## What is bioinformatics?
Bioinformatics is a field of science that combines aspects of biology, computer science, and information technology to analyze biological information using computers and statistical techniques. The primary goal of bioinformatics is to develop software tools to generate useful biological knowledge. In microbial ecology, bioinformatic tools are typically used to analyze DNA sequence data. These data can include sequences from cultured organisms or sequences from communities. The latter is discussed in more detail below.

## Why study microorganisms using DNA sequences, and how is it done?
Greater than 99% of the microbes found in nature cannot be cultured and studied in the laboratory. Techniques have been rapidly advancing in recent years making it possible to study microbes and their communities in news ways without the need for culturing. To study these “unculturable” organisms, scientists study their DNA (and sometimes RNA). They collect a sample like a gram of soil or a liter of seawater and extract all the DNA in that sample. Most commonly, a specific gene in that DNA, the 16S rRNA gene, is amplified using polymerase chain reaction (PCR). This produces many copies of all the 16S rRNA genes present in the sample. The 16S genes are sequenced using “high-throughput” DNA sequencing technology that generates thousands (and sometime up to millions) of 16S gene sequences present in every sample. From these 16S gene sequences, we can learn which microbes are present in the sample and their relative abundance.

The 16S rRNA gene is one gene of choice for studying microbial communities for three primary reasons. First, all bacteria have at least one copy of the gene in their genome. Second, there are regions of the gene sequence that are highly variable (which allows us to distinguish among closely related bacteria) and other regions that are more conserved (which allows us to compare among more distantly related groups). Third, it is phylogenetically conserved. This means that closely related bacteria have more similar 16S rRNA gene sequences than do distantly related bacteria.

## Study background
*Study data*\
For this exercise you will be analyzing 16S rRNA gene sequences from human gut samples. The samples were collected from children in Europe (14 samples) and a rural African village in Burkina Faso (14 samples).

*The human gut microbiome*\
Microorganisms in the human gastrointestinal tract (GI) perform functions and produce compounds essential for our health. They break down complex molecules (e.g. complex polysaccharides) from the food we eat making them easier for our cells to digest. They produce essential vitamins (e.g. B12 and K) and amino acids, which are absorbed by cells in the gut and then used throughout the body (1). This community of microorganisms inhabiting our gut is known as the human gut microbiome.

The composition and function of the gut microbiome varies among individuals and populations. Factors such as ethnicity, diet (e.g. diets rich in protein versus diets rich in complex carbohydrates), and genetics are known to contribute to the variation we see in the human gut microbiome (2). Variation in the composition of these microbial communities also leads to variation in their function. One interesting example of this is a study that compared the gut microbiome of Japanese and American populations (3). Researchers found a high abundance of bacteria carrying a specific gene in Japanese populations compared to American populations. This gene helps the microbes break down complex carbohydrates found in the seaweed used to make nori, one the main ingredients in sushi and a common ingredient in other Japanese cuisine. Because seaweed is a larger part of the diet in Japanese populations compared to American populations, the guts of Japanese populations harbor this seaweed-digesting bacterium, which helps them get the most energy possible from their food.  (There’s another interesting level to this story.  The gut bacteria that carry this gene actually acquired it though horizontal gene transfer from marine bacteria that colonize the seaweed in the ocean!). This is just one of many examples of how diet can affect the composition and function of gut microbial communities.

## Hypotheses
For each of the following questions provide your answer as well as one sentence stating your formal hypothesis.
1.	In general, do you think the Europe (EU) communities will be very similar or very different to the Burkina Faso (BF) communities? Why?

2.	Do you think the EU communities will differ in the number of types of bacteria compared to the BF communities?

3.	Do you think the communities will differ in evenness? Evenness is highest when the taxonomic groups in a sample have the same abundance.

4.	Do you think the communities will differ in their function? How?

```
Hey look this is a place to put code

```
