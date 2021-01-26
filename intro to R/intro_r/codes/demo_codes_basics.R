# Install Libraries/packages
install.packages("dplyr")
#import library

library(dplyr) #statistical grammar
library(tidyverse) #for data manipulation
library(readxl) #to read excel file
library(ggplot2) #for data manipulation
library(rtweet) # to extract tweeter data

#Check working directory
getwd()

#checking working directory
setwd("C:/Users/Maria Ulfah/Downloads/R_presentasi")

#checking what are in working directory
dir()

#check what are in data/input
dir("data/input")

# Assigning new variables with different types of data

x <- 1  # numeric
y <- 2.5  # numeric
z <- "name" #character
w <- TRUE #logical

# Check type of data using class() function
class(x)
class(y)
class(z)
class(w)

# R as calculator (using arithmatic operators in R)
100 ** 2 # exponentiation (pengkuadratan)
100 * 2 # multiplication (perkalian)
100 - 10 # substraction (pengurangan)
90 + 10 # addition (penjumlahan)
20 %% 7 # Modulo (sisa pembagian)
100 / 5 #division (pembagian)

# Calculate variables
harga_tas <- 100 + (100*0.016)
harga_tas

harga_baju <- 800 + (800 * 0.016)
harga_baju

total_belanja <- harga_tas + harga_baju
total_belanja

# calculate characters (R: cannot calculate "characters")
sister <- "Jenny"
brother <- "John"
"a" + "b"




