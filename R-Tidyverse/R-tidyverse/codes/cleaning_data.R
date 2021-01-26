library(readr)
library(tidyverse)
library(dplyr)
library(haven)

#import data

bike <- readRDS("data/input/r_cleaning/bike_share_rides_ch1_1.rds")

#cek data type
glimpse(bike)
# is.numeric(variable_name) -- return "TRUE/FALSE"
# class() --- return "information type of data"
# <dbl> == numeric
# <chr> == character

#summary() statistics
summary(bike$user_birth_year)

#converting data type
class(bike$user_birth_year) # from numeric
as.factor(bike$user_birth_year) # to be factor





#removing "character in string variable"
library(stringr)
# function to remove
# str_remove(df$varible, "what we want to remove?")



