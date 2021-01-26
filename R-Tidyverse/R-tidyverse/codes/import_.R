library(readr) # to read dataset
library(dplyr)
library(tidyverse)
install.packages("skimr")
library(skimr)


#ls(rm("bakeoff")) #delete a value/variable in environment
#rm(list = ls(all.names = TRUE)) #delete all environment 

getwd()
setwd("C:/Users/Maria Ulfah/Downloads/R_presentasi/R-tidyverse")
dir("data/input/bakeoff")



    # Import .csv file

#- in CSV comma separated values within a row, 
#- in CSV each row is a new observation
# ?read_csv --- to know more about csv file

# import .csv file, and identifying missing values in dataset

bakeoff <- read_csv("data/input/bakeoff.csv", skip =1,
                      na = c("", "NA", "UNKNOWN"))

glimpse(bakeoff)
skim(bakeoff)
