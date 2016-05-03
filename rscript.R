#First set the working directory to the class repo folder
setwd("~/Desktop/BI331-taxonomy/")

#Install and load packages needed for this script
require(dplyr)
require(tidyr)
require(ggplot2)
require(scales)

###--- PART ONE: TAXONOMIC COMPARISON ---###

#Load in the data generated from the RDP classifier. This script uses the heirarchy files:
BF_table <- read.table("BF_heir.txt", header = TRUE, sep = "\t")
EU_table <- read.table("EU_heir.txt", header = TRUE, sep = "\t")

#the dplyr package is a great tool for manipulating data frames. In order to make our plots work we need to...

#reformat and combine our tables
bf <- BF_table %>%
    #pull out only the rows that have phylum-level data (including unclassified)
    filter(grepl('Root;rootrank;Bacteria;domain;unclassified_Bacteria', lineage) | rank=="phylum") %>%
    #we only need the "name" and  ".fasta" columns:
    select(one_of(c("name", "BF_samples.fasta"))) %>%
    #to help join our two samples we make a new column called "sample" with every entry showing "Burkina Faso"
    mutate(sample = "Burkina Faso") %>%
    #renaming the ".fasta" column to "OTUs"
    rename(OTUs = BF_samples.fasta)

#Repeat for the Europe table
eu <-EU_table %>%
  filter(grepl('Root;rootrank;Bacteria;domain;unclassified_Bacteria', lineage) | rank=="phylum") %>%
  select(one_of(c("name", "EU_samples.fasta"))) %>%
  mutate(sample = "Europe") %>%
  rename(OTUs = EU_samples.fasta)

#Bind the two tables by their rows, this puts our table in "long format"
abundance_table <- rbind(bf, eu)

#Add a new column that corresponds to the percentage of the phylum in the sample (BF or EU)
abundance_table <- group_by(abundance_table, sample) %>% 
  mutate(percent=as.numeric(paste0(round(OTUs/sum(OTUs), 4)))) %>% 
  ungroup

# plot using the ggplot2 package:
ggplot(abundance_table, aes(x=sample, y=percent, fill=name)) + 
  #instead of the default "counts" binning make the y axis correspond to percents
  geom_bar(stat="identity") +
  #make it pretty
  scale_fill_brewer(palette = "Set1", name = "Phylum") +
  scale_y_continuous(labels = percent) +
  labs(title ="Microbiome Composition:\nBurkina Faso vs. Europe", x = "Origin", y = "")

#save the plot (this creates a picture in your current working directory)
ggsave("abundance_stacked_barplot.png")
  

###--- PART TWO: STATISTICAL COMMUNITY COMPARISON ---###

#read in the libcompare file
libcompare <- read.table("libcompare.txt", header = TRUE, sep = "\t", skip = 3)

#use dplyr to reshape the data in order to plot 
sig <- libcompare %>%
  rename("BurkinaFaso" = Sample1, "Europe" = Sample2) %>%
  #pull out only phylum level - note we aren't looking at unclassified in this case
  filter(Rank == "phylum") %>%
  #here we use the gather function to move OTU counts into one column and create a new column for the country of origin
  gather(sample, OTUs, BurkinaFaso, Europe) %>%
  #arrange in descending values of significance (lower = more significance) and group this by name
  arrange(Significance, Name) %>%
  #filter the lowest 8 rows, or 4 phyla (from each sample)
  do(head(., n=8))

#use ggplot to create a clustered bar chart  
ggplot(sig, aes(x=Name, y=OTUs, fill=sample)) + 
  #make this a clustered bar (dodge) and instead of the default binning, use # of OTUs as y axis
  geom_bar(position="dodge", stat="identity") +
  #make it pretty
  scale_fill_brewer(palette = "Accent", name = "Origin") +
  #add informative lables
  labs(title ="Top Significantly Different Phyla:\nBurkina Faso vs. Europe", x = "Phylum", y = "OTUs") +
  #ggplot defaults to alphabetical order, tell it instead to use the order in our data frame, grouped by Name: 
  scale_x_discrete(limits = sig$Name)

#save to a file in your working directory
ggsave("significance_clustered_bar.png")
  

