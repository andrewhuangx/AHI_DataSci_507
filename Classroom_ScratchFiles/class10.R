library(dplyr)
library(stringr)
library(reshape2)
library(tidyverse)
library(pastecs)
library(car)

heartfailure = read.csv('/Users/hantswilliams/Dropbox/Biovirtua/Python_Projects/ahi/AHI_DataSci_507/Datasets/HeartDisease/heart.csv')

myvars <- c('chol', 'thal', 'cp')
workingdf = heartfailure[myvars]

workingdf$thal = as.factor(workingdf$thal)
workingdf$cp = as.factor(workingdf$cp)


# Two-way - no interaction prediction 
two.way <- aov(chol ~ thal + cp, data = workingdf)
two.way

# Two-way - with interaction prediction 
two.way <- aov(chol ~ thal + cp, data = workingdf)

Anova(two.way, type="III")


# TUKEY 
TukeyHSD(two.way)
TukeyHSD(two.way, which="thal:cp")



