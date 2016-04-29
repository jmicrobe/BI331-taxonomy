# Assignment

The following section will help you frame your understanding of microbial ecology, as well as interpret the results of your analyses and figures. Also included are suggestions for further analysis and/or modifications to the provided R script.

## Formulate hypotheses
Answer the following questions, and **include a sentence stating your formal hypothesis** for each.

1. In general, do you think the Europe (EU) communities will be very similar or very different to the Burkina Faso (BF) communities? Why?

2.	Do you think the EU communities will differ in the number of types of bacteria compared to the BF communities?

3.	Do you think the communities will differ in evenness? Evenness is highest when the taxonomic groups in a sample have the same abundance.

4.	Do you think the communities will differ in their function? How?

## Results & Interpretation
For the first figure (**taxonomic comparison**):

1.  Do the BF and EU communities differ in the number of taxonomic groups at the taxonomic levels you analyzed?

2.  Examine your charts. Which community appears more even?

3.  Which taxonomic groups are most abundant in the Burkina Faso communities? The Europe communities?

4.  How do your results compare to your hypotheses?

For the second figure (**statistical significance**):

1.  Which phyla are significantly more abundant in the Burkina Faso communities? The Europe communities?

2.  Based on what you know about the physiology of the phyla discussed in the previous question, can you make any inferences about the differences in the function of these communities?

3.  How does this relate back to your hypotheses?

## Modifications to the R script

There are many ways you can modify the provided R script to gain a better understanding of the R environment, as well as analyze different parts of the data generated with RDPTools.

* Try changing the colors and/or labels of the plots you generated.
    * Hint: [This](http://www.cookbook-r.com/Graphs/Legends_(ggplot2)/) guide will help understand ggplot lables, and [this one](http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/) is helpful for modifying colors.


* Try modifying the data frames generated with dpylyr so you can compare samples at the "class" or "order" level instead of "phylum". Re-run the script to create new figures that reflect this - but make sure to update the plot labels with the correct taxonomic level!
    * Hint: You shouldn't need to, but if you want to reshape the data frame [here](https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf) is a handy cheatsheet for dpylyr functions.
