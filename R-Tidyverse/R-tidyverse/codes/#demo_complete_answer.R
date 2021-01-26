#import library

library(gapminder) #data countries in the world
library(tidyverse) # data manipulation package
library(dplyr) #data manipulation package built under tidyverse
library(readr) #to read Rds dataset
library(readxl) #to read excel file
library(haven) #to read various type of file
library(jsonlite) #to read Json

#delete values/variable from the environment
#ls(rm("pop_past")) #remove only specific
#rm(list = ls(all.names = TRUE)) #delete all environment

#check & set Working Directory
getwd()
setwd("C:/Users/Maria Ulfah/Downloads/R_presentasi/R-tidyverse")
dir()

#import getminder data from "library gapminder"
gapminder <- gapminder

# check summary gapminder: variables, number of rows, and statistical information from numeric variables
summary(gapminder)

#import data from .dta format
wardata <- read_dta("data/input/workshop/FL03.dta") #dataset about wars and conflicts between/among countries

#cek dimension of dataset wardata: (rows, columns)
dim(wardata) 

#cek variable names
names(wardata)

#----------------------------------------------------------------------------------------------------------------------------------------------------

#SUBSETTING & Filterring

#wardata: subset only 10 rows, and first 20 columns
wardata[1:10, 1:20]

#wardata: subset only country and year, in 10 first rows
wardata[1:10, c("country", "year")]

#wardata: subset() country == "USA", year == 1945 and 1950
subset(wardata, country == "USA" & year == c(1945, 1950))

#wardata: filter() country == "USA", year == 1945 and 1950
wardata %>%
  filter(country == "USA", year == c(1945, 1950))

#gapminder: filter() country == "United States", year == 2007
gapminder %>%
  filter(country == "United States", year == 2007)

#gapminder: filter() year == 2007, arrange(gdpPercap) #default ascending order
gapminder %>%
  filter(year == 2007) %>%
  arrange(gdpPercap)

#gapminder: filter() year == 2007, arrange(gdpPercap) #descending order
gapminder %>%
  filter(year == 2007) %>%
  arrange(desc(gdpPercap))


#----------------------------------------------------------------------------------------------------------------------------------------------------------
#Mutate (Replacing Values & Adding New Variable)

#gapminder: shorten values in pop variable, divide it into million
#mutate : changing values in pop variable (with a million)
pop_million <- gapminder %>%
  mutate(pop = pop/1000000) %>%
  arrange(desc(pop))# sort desc order
pop_million

#gapminder: creating new variable gdp from gdpPercap * pop
gapminder_gdp <- gapminder %>%
  mutate(gdp = gdpPercap * pop) %>%
  arrange(desc(gdp))
gapminder_gdp


#shorten gdp values into million USD
gapminder_gdp_mill <- gapminder_gdp %>%
  mutate(gdp = gdp / 1000000) %>%
  arrange(desc(gdp)) %>%
  filter(year == 2007) %>% #filter only 2007
  
  gapminder_gdp_mill

#------------------------------------------------------------------------------------------------------------------------------------------------------------
#summarize(), group_by(), merge()

#gapminder_gdp: summary mean_gdp = mean(gdp)
gapminder_avg_gdp <- gapminder_gdp %>%
  group_by(continent) %>%
  summarize(avg_gdp_continent = mean(gdp),
            avg_gdpPerCap_continent = mean(gdpPercap))
gapminder_avg_gdp

#gapminder_gdp: merge gapminder_avg_gdp to gapminder_gdp by = "continent"

gapminder_gdp_by_cont <- merge(gapminder_gdp, gapminder_avg_gdp, by= "continent")
gapminder_gdp_by_cont

#-----------------------------------------------------------------------------------------------------------------------------------------------------------
#Check Duplicates Data & creating unique identifier                                        

#cek wardata
wardata

#to check duplicates, things we have to put in concern:
# 1. need unique identifier, in wardata we have:
#                     a.year -> tahun laporan ---> can be overlapped with countries' names
#                     b. ccode -> country ID code ---> can be overlapped with year's period
# therefore, to create a unique identifier, we need to combine the two (year and ccode) in a new codyear variable
wardata$codyear <- wardata$ccode*10000 + wardata$year

#check data 1:10 in codyear variable
wardata$codyear[1:10]

#check variable name in wardata
names(wardata) 

#prove is there any duplicate information?
length(wardata$codyear) #check length of elements in codyear
length(unique(wardata$codyear)) #check unique elements in codyear. if those show the same numbers, mean NO DUPLICATE found.

#_______________________________________________________________________________________________________________________________________________________
# Removing Duplicates

# We’ll use the R built-in iris data set, which we start by converting into a tibble data frame (tbl_df) for easier data analysis.

spesies_data <- as_tibble(iris)



#chek dimension my_data --- 150 rows and 5 columns
dim(spesies_data)

#check duplicate values in rows of a variable (Sepal.Lenght) --> can only check based on a specific variable
duplicates_Sepal <- spesies_data[duplicated(spesies_data$Sepal.Length),]

#keep only non-duplicate rows based on a specific variable (Sepal.Length)
unique_Sepal <- spesies_data[!duplicated(spesies_data$Sepal.Length),]
#check dimension, to see how many rows are left
dim(unique_Sepal)

#remove duplicated rows using unique()
unique_rows <- unique(spesies_data)
#check dimension of unique_rows ---
dim(unique_rows)

#remove duplicated rows using distinct()
#Remove duplicate rows based on all columns:
distinct_rows <- spesies_data %>% 
  distinct()
#check dimension distinct_rows --- should has similar result as using unique()
dim(distinct_rows)

#remove duplicates based on multiple columns (eg: Sepal.Length, Petal.Width)
distinct_sepal_petal <- spesies_data %>%
  distinct(Sepal.Length, Petal.Width, .keep_all = TRUE)

#check dimension
dim(distinct_sepal_petal)


# ______________________________________________________________________________________________________________________________________________________
#Replacing or Removing Missing Values
dir("data/input")

#import titanic.csv dataset 
df_titanic <- read.csv("data/input/titanic.csv")
#check dimension & column_names df_titanic
dim(df_titanic) 
names(df_titanic)

#check where missing values are located (which column?)

list_na <- colnames(df_titanic)[ apply(df_titanic, 2, anyNA) ]
list_na

#check missing values in Age column, showed by Name and Sex
df_titanic[is.na(df_titanic$Age), 
           c("Name", "Sex")]

#removing rows contained missing values --- na.omit() 

df_titanic_omit <- df_titanic %>%
  na.omit()

#check dimension df_titanic_omit -- jumlah rows akan berkurang
dim(df_titanic_omit)

#----------------------------- omitting NA/missing values is not smart solution, we can replace missing values with mean/median----------------------

# Replace NA with Avarage of Pessanger Age 
df_titanic$Age[which(is.na(df_titanic$Age))] <- mean(df_titanic$Age, na.rm = TRUE) #na.rm = TRUE (ignore calculating NA value)

df_titanic[is.na(df_titanic$Age),]



# _______________________________________________________________________________________________________________________________________________________
# Merging datasets

# we will work to combine/merge wardata and data from exppop.txt.
# Both datasets have country code ID and year ---> this will create unique identifier

dir("data/input/workshop")

#import exppop.txt: the data of countries' population since the 1800s to early 2000s

exppop <- read.table("data/input/workshop/exppop.txt", header=TRUE, sep="\t")

exppop

#check variable names in in pop_past
names(exppop)
#check variable names in wardata
names(wardata)

#exppop: create similar unique identifier to wardata
exppop$idyear <- exppop$idnum*10000 + exppop$year

#exppop: check duplicates idyear
length(exppop$idyear)
length(unique(exppop$idyear))

#exppop: has similar variable name with wardata ---> "pop" variable name must be changed
names(exppop)[4] <- "pop_ex"


#MERGING: merge pop_ex in exppop to wardata, identified by its year.
# by.x = "codyear" --- artinya hanya merging data yang memiliki similar unique identifier dengan "codyear"

dataset <- merge(wardata, exppop[, c("idyear", "pop_ex")], by.x = "codyear", by.y = "idyear", all.x = TRUE)



#check variable names in dataset:is "pop_ex" has been successfully merged?
names(dataset)

#dataset: look closer to merged variable

closer_dataset <- dataset[,c("cname", "year", "pop", "pop_ex", "codyear")]
